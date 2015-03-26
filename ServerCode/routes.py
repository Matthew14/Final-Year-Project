import socket
import sys
import random
import hashlib
import os
import http_codes
import track_details
import subprocess

from functools import wraps
from app import app
from flask import request, send_file, abort, make_response, jsonify, session, send_from_directory, g, redirect
from analysis.moodAssesment import rank_track
from pg_db import Postgres


prod_base_dir = '/home/fypuser/Final-Year-Project/ServerCode/'
prod_upload_directory = prod_base_dir + 'uploads'
dev_upload_directory = 'C:\\users\matthew\\desktop\\uploads'
prod_images_directory = prod_base_dir + 'images'
prod_temp_directory = prod_base_dir + 'tmp'
prod_out_directory = prod_base_dir + 'out'

isProd = socket.gethostname() == 'FYP'

base_dir = prod_base_dir if isProd else '.'
upload_directory = prod_upload_directory if isProd else dev_upload_directory
images_directory = prod_images_directory if isProd else 'images'
temp_directory = prod_temp_directory if isProd else 'tmp'
out_dir = prod_out_directory if isProd else 'out'


#################################
#Helper functions


def get_database():
    db = g.get('db', None)

    if db is None:
        db = Postgres()
        setattr(g, 'db', db)

    return db


def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "logged_in" not in session:
            return make_response('not logged in', http_codes.UNAUTHORIZED)
        return f(*args, **kwargs)
    return decorated_function


def hash_password(password):
    return hashlib.sha256(password).hexdigest()


def save_track_in_right_place(track, tmp_file_path):
    """ Works out where a track should be saved based on artist/album info and
        saves it in that correct place

        Arguments:
        track -- the TrackDetails object to move
        tmp_file_path -- temp directory to write to (differs between prod/dev)
    """

    artist_dir = os.path.join(upload_directory, track.artist)
    album_dir = os.path.join(artist_dir, track.album)

    if not os.path.isdir(artist_dir):
        os.mkdir(os.path.join(artist_dir))

    if not os.path.isdir(album_dir):
        os.mkdir(album_dir)

    final_path = os.path.join(upload_directory, track.filepath)
    if not os.path.isfile(final_path):
        os.rename(tmp_file_path, final_path)


##################################
# Non Api routes:


@app.route('/')
def index():
    return redirect('https://www.github.com/matthew14/Final-Year-Project')


@app.route('/images/<string:imagepath>')
def get_image(imagepath):
    return send_from_directory(images_directory, imagepath)


@app.route('/upload', methods=['POST'])
def upload():

    username = None if 'username' not in session else session['username']

    if username is None:
        abort(http_codes.UNAUTHORIZED, "not logged in")

    f = request.files['file']

    temp_save_path = os.path.join(temp_directory, f.filename)
    f.save(temp_save_path)

    track = track_details.load_from_file(temp_save_path)

    save_track_in_right_place(track, temp_save_path)

    p = get_database()
    rank_track(track)

    p.associate_track_with_user(track, username)

    return "done"


@app.route('/music/<string:artist>/<string:album>/<string:filepath>')
def get_music_file(artist=None, album=None, filepath=None):
    return send_from_directory(os.path.join(upload_directory, artist, album), filepath)


##############################################
# API Routes:

@app.route('/api/track/<string:excitedness>/<string:positivity>')
def track(excitedness=None, positivity=None):

    username = None if 'username' not in session else session['username']

    if username is None:
        abort(http_codes.UNAUTHORIZED, "not logged in")

    try:

        try:
            excitedness = float(excitedness)
            positivity = float(positivity)
        except:
            abort(http_codes.INTERNAL_SERVER_ERROR, 'Only numbers please, friend.')

        p = get_database()
        tracks = p.get_tracks_by_excitedness_and_positivity(username, excitedness, positivity)

        if len(tracks) > 0:
            return jsonify(random.choice(tracks).__dict__)

        return None
    except Exception as e:
        print e.message
        return None


@app.route('/api/statistics')
def stats():

    '''get statistics about the logged in user
        including number of tracks in the system and whether reanalysis is
        taking save_track_in_right_place
    '''

    username = None if 'username' not in session else session['username']

    if username is None:
        abort(http_codes.UNAUTHORIZED, "not logged in")

    p = get_database()

    user_stats = p.get_user_stats(username)

    if user_stats is None:
        abort(http_codes.INTERNAL_SERVER_ERROR, "something went wrong")


    return jsonify(user_stats.__dict__)


@app.route('/api/whoami')
def who_am_i():
    '''return which user the client is currently logged in as'''
    return make_response("not logged in", http_codes.UNAUTHORIZED) if 'username' not in session else session['username']


@app.route('/api/loggedin')
def logged_in():
    '''route to check if a client is logged in'''
    return jsonify(logged_in=str('logged_in' in session and session['logged_in']))


@app.route('/api/login', methods=['POST'])
def login():
    '''authenticate user and set session vars'''

    json = request.get_json()
    if 'username' not in json:
        return make_response('no username specified', http_codes.BAD_REQUEST)

    if 'password' not in json:
        return make_response('no password specified', http_codes.BAD_REQUEST)

    p = get_database()

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
    ''' clear session info - 'log out'
    '''
    session['logged_in'] = False
    session['username'] = None
    session.clear()


@app.route('/api/users/<string:username>')
def get_user(username):
    '''
    A route to retrieve information about a user

    '''
    p = get_database()
    user = p.get_user_as_dict(username)

    if user is None:
        abort(http_codes.NOT_FOUND)

    del user['passwordhash']

    return jsonify(user)


@app.route('/api/users/new', methods=['POST'])
def create_user():
    json = request.get_json()

    print json
    if 'username' not in json:
        return make_response('no username specified', http_codes.BAD_REQUEST)

    if 'password' not in json:
        return make_response('no password specified', http_codes.BAD_REQUEST)

    username = json['username']
    password_hash = hash_password(json['password'])
    first_name = json['first_name'] if 'first_name' in json else None
    surname = json['surname'] if 'surname' in json else None
    email = json['email'] if 'email' in json else None

    p = get_database()

    if p.user_exists(username):
        return make_response('user {} already user already exists'.format(username), http_codes.BAD_REQUEST)

    p.add_user(username, password_hash, first_name, surname, email)


    return username


@app.route('/api/analysisInProgress')
def analysis_in_progress():
    username = None if 'username' not in session else session['username']

    if username is None:
        abort(http_codes.UNAUTHORIZED, "not logged in")

    return ""


@app.route('/api/reanalyze')
def reanalyze():

    username = None if 'username' not in session else session['username']

    error_file = os.path.join(out_dir, 'err')
    script = os.path.join(base_dir, 'reanalyze.py')
    print error_file
    with open(error_file, 'a') as f:
        p = subprocess.Popen([sys.executable, script, username], stdout=subprocess.PIPE, stderr=f)

    return ""

@app.route('/api/disagree/<string:artist>/<string:track>/<string:thoughts>')
def disagree(artist, track, thoughts):

    if thoughts not in ['mp', 'lp', 'me', 'le']:
        abort(http_codes.NOT_FOUND, "code is wrong")

    p = get_database()
    p.disagree(artist, track, thoughts)

    return thoughts
