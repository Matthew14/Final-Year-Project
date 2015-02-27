import socket
import random
import dbAccess
from app import app
from flask import request, send_file, abort, make_response, jsonify, session
from analysis.moodAssesment import rankTrack
from pg_db import Postgres
import hashlib


#TODO filthy hack, plz change
uploadDirectory = '/var/www/fyp/uploads' if socket.gethostname() == 'FYP' else 'uploads'


@app.route('/')
def index():
    return 'hello there'


@app.route('/upload', methods=['POST'])
def upload():
    if request.method == 'POST':
        f = request.files['file']
        destination = uploadDirectory + '/' + f.filename
        f.save(destination)

        rankTrack(destination)

    return ''


@app.route('/track/<string:calmness>/<string:positivity>')
def track(calmness=None, positivity=None):
    try:
        calmness = float(calmness)
        positivity = float(positivity)
    except:
        abort(500, 'Only numbers please, friend.')

    tracks = dbAccess.getTracksByCalmnessAndPositivity(calmness, positivity)

    return 'hello'


@app.route('/music/<string:filepath>')
def get_music_file():
    pass


@app.route('/happy')
def happy():
    tracks = dbAccess.getHappyTracks()
    return send_file(random.choice(tracks)[0], mimetype='audio/mpeg')


@app.route('/sad')
def sad():
    tracks = dbAccess.getSadTracks()
    return send_file(random.choice(tracks)[0], mimetype='audio/mpeg')


def hash_password(password):
    return hashlib.sha256(password).hexdigest()




# API:

@app.route('/login', methods=['POST'])
def login():
    json = request.get_json()
    if 'username' not in json:
        return make_response('no username specified', 400)

    if 'password' not in json:
        return make_response('no password specified', 400)

    p = Postgres()

    username = json['username']
    password_hash = hash_password(json['password'])

    if p.authenticate(username, password):
        session['logged_in'] = True
        session['username'] = username


@app.route('/api/users/<string:username>')
def get_user(username):
    p = Postgres()
    user = p.get_user_as_dict(username)

    if user is None:
        abort(404)

    del user['passwordhash']
    return jsonify(user)


@app.route('/api/users/new', methods=['POST'])
def create_user():
    json = request.get_json()

    if 'username' not in json:
        return make_response('no username specified', 400)

    if 'password' not in json:
        return make_response('no password specified', 400)

    username = json['username']
    password_hash = hash_password(json['password'])
    first_name = json['first_name'] if 'first_name' in json else None
    surname = json['surname'] if 'surname' in json else None

    p = Postgres()

    if p.user_exists(username):
        return make_response('user {} already user already exists'.format(username), 400)

    p.add_user(username, password_hash, first_name, surname)

    return username
