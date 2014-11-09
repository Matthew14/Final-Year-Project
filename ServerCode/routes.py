from app import app
from flask import request

uploadDirectory = 'uploads'


@app.route('/upload', methods=['GET', 'POST'])
def upload():
    if request.method == 'POST':
        f = request.files['file']
        f.save(uploadDirectory+'/'+f.filename)
    return ''
