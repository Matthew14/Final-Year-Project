import socket
import random
import hashlib
import os
import http_codes
import track_details

from functools import wraps
from app import app
from flask import request, send_file, abort, make_response, jsonify, session, send_from_directory
from analysis.moodAssesment import rank_track
from pg_db import Postgres


#TODO filthy hack, plz change
prod_upload_directory = '/home/fypuser/Final-Year-Project/ServerCode/uploads'
dev_upload_directory = 'C:\\users\matthew\\desktop\\uploads'
prod_images_directory = '/home/fypuser/Final-Year-Project/ServerCode/images'
prod_temp_directory = '/home/fypuser/Final-Year-Project/ServerCode/tmp'

isProd = socket.gethostname() == 'FYP'
upload_directory = prod_upload_directory if isProd else dev_upload_directory
images_directory = prod_images_directory if isProd else 'images'
temp_directory = prod_temp_directory if isProd else 'tmp'


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


@app.route('/images/<string:imagepath>')
def get_image(imagepath):
    return send_from_directory(images_directory, imagepath)


def save_track_in_right_place(track, tmp_file_path):
    artist_dir = os.path.join(upload_directory, track.artist)
    album_dir = os.path.join(artist_dir, track.album)

    if not os.path.isdir(artist_dir):
        os.mkdir(os.path.join(artist_dir))

    if not os.path.isdir(album_dir):
        os.mkdir(album_dir)

    final_path = os.path.join(upload_directory, track.filepath)
    os.rename(tmp_file_path, final_path)


@app.route('/upload', methods=['POST'])
def upload():

    #TODO: this is temporary
    username='matt'

    if request.method == 'POST':
        f = request.files['file']

        temp_save_path = os.path.join(temp_directory, f.filename)
        f.save(temp_save_path)

        track = track_details.load_from_file(temp_save_path)

        save_track_in_right_place(track, temp_save_path)

        p = Postgres()
        rank_track(track)
        p.associate_track_with_user(track, username)


    return ''


@app.route('/api/track/<string:excitedness>/<string:positivity>')
def track(excitedness=None, positivity=None):

    #TODO
    username = 'matt'

    try:
        excitedness = float(excitedness)
        positivity = float(positivity)
    except:
        abort(500, 'Only numbers please, friend.')

    p = Postgres()
    tracks = p.get_tracks_by_excitedness_and_positivity(username, excitedness, positivity)

    print tracks

    return jsonify(tracks[0].__dict__)if len(tracks) > 0 else None


@app.route('/music/<string:artist>/<string:album>/<string:filepath>')
def get_music_file(artist=None, album=None, filepath=None):
    return send_from_directory(os.path.join(upload_directory, artist, album), filepath)


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

    try:
        if p.authenticate(username, password_hash):
            session['logged_in'] = True
            session['username'] = username
        else:
             abort(http_codes.UNAUTHORIZED)

    except Exception as e:
        print e.message
        raise e

    return username


@app.route('/api/logout')
def logout():
    session['logged_in'] = False
    session['username'] = None
    session.clear()


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
