import os


CSRF_ENABLED = True
SECRET_KEY = 'reallysecrettoughkey'
basedir = os.path.abspath(os.path.dirname(__file__))

db_name = None
db_user = None
db_host = None
db_password = None


lastfm_api_key = None
lastfm_api_secret = None


def load_lastfm_creds():
    #a file with one line as follows:
    #api_key|api_secret
    lfm_creds_file = os.path.join(basedir, 'lastfm_credentials.txt')

    global lastfm_api_key
    global lastfm_api_secret

    with open(lfm_creds_file, 'r') as f:
        line = f.read().strip().split('|')
        lastfm_api_key = line[0]
        lastfm_api_secret = line[1]


def load_db_creds():
    #a file with one line as follows:
    #host|db name|user|password
    db_creds_file = os.path.join(basedir, 'database_credentials.txt')

    global db_name
    global db_user
    global db_host
    global db_password

    with open(db_creds_file, 'r') as f:
        line = f.read().strip().split('|')
        db_host = line[0]
        db_name = line[1]
        db_user = line[2]
        db_password = line[3]

load_db_creds()
load_lastfm_creds()
