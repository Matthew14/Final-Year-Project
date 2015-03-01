import os
CSRF_ENABLED = True
SECRET_KEY = 'reallysecrettoughkey'
basedir = os.path.abspath(os.path.dirname(__file__))

db_name = None
db_user = None
db_host = None
db_password = None

def load_db_creds():
    #a file with one line as follows:
    #host|db name|user|password
    db_creds_file = basedir + '/' + 'database_credentials.txt'

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
