import socket
from app import app
from flask import request

uploadDirectory = '/var/www/fyp/uploads' if socket.gethostname() == 'FYP' else 'uploads'


@app.route('/')
def index():
    return 'hello there'

@app.route('/upload', methods=['POST'])
def upload():
    if request.method == 'POST':
        f = request.files['file']
        f.save(uploadDirectory+'/'+f.filename)
    return ''
