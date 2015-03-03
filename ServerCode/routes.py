import socket
import random
import hashlib
import dbAccess
import http_codes

from functools import wraps
from app import app
from flask import request, send_file, abort, make_response, jsonify, session
from analysis.moodAssesment import rankTrack
from pg_db import Postgres


#TODO filthy hack, plz change
prodUpload = '/home/fypuser/Final-Year-Project/ServerCode/uploads'
devUpload = 'C:\\users\matthew\\desktop\\uploads'
uploadDirectory = prodUpload if socket.gethostname() == 'FYP' else devUpload


def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "logged_in" not in session:
            return make_response('not logged in', http_codes.UNAUTHORIZED)
            make_response('not logged in', http_codes.UNAUTHORIZED)
        return f(*args, **kwargs)
    return decorated_function


@app.route('/')
def index():
    return 'hello there, it works'


@app.route('/upload', methods=['POST'])
@login_required
def upload():
    if request.method == 'POST':
        f = request.files['file']
        destination = uploadDirectory + '/' + f.filename
        f.save(destination)

        rankTrack(destination)

    return ''


@app.route('/track/<string:calmness>/<string:positivity>')
@login_required
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

@app.route('/api/loggedin')
def logged_in():
    return jsonify(logged_in=str('logged_in' in session and session['logged_in']))


@app.route('/api/login', methods=['POST'])
def login():
    json = request.get_json()
    if 'username' not in json:
        return make_response('no username specified', http_codes.BAD_REQUEST)

    if 'password' not in json:
        return make_response('no password specified', http_codes.BAD_REQUEST)

    p = Postgres()

    username = json['username']
    password_hash = hash_password(json['password'])

    if p.authenticate(username, password):
        session['logged_in'] = True
        session['username'] = username


@app.route('/api/logout')
def logout():
    session.clear()
    return ''


@app.route('/api/users/<string:username>')
def get_user(username):
    p = Postgres()
    user = p.get_user_as_dict(username)

    if user is None:
        abort(http_codes.NOT_FOUND)

    del user['passwordhash']

    return jsonify(user)


@app.route('/api/users/new', methods=['POST'])
def create_user():
    json = request.get_json()

    if 'username' not in json:
        return make_response('no username specified', http_codes.BAD_REQUEST)

    if 'password' not in json:
        return make_response('no password specified', http_codes.BAD_REQUEST)

    username = json['username']
    password_hash = hash_password(json['password'])
    first_name = json['first_name'] if 'first_name' in json else None
    surname = json['surname'] if 'surname' in json else None
    email = json['email'] if 'email' in json else None

    p = Postgres()

    if p.user_exists(username):
        return make_response('user {} already user already exists'.format(username), http_codes.BAD_REQUEST)

    p.add_user(username, password_hash, first_name, surname, email)

    return username
