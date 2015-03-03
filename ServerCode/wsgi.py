activate_this = '/home/fypuser/Final-Year-Project/ServerCode/env/bin/activate_this.py'
execfile(activate_this, dict(__file__=activate_this))
import sys
sys.path.insert(0, '/home/fypuser/Final-Year-Project/ServerCode/')
from app import app as application

if __name__ == '__main__':
    application.run()
