import socket
import random
import dbAccess
from app import app
from flask import request, send_file
from moodAssesment import rankTrack


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


@app.route('/happy')
def happy():
    tracks = dbAccess.getHappyTracks()
    return send_file(random.choice(tracks)[0], mimetype='audio/mpeg')


@app.route('/sad')
def sad():
    tracks = dbAccess.getSadTracks()
    return send_file(random.choice(tracks)[0], mimetype='audio/mpeg')
