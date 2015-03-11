import sqlite3
import os


db_path = os.path.join(os.environ['APPDATA'], 'UploadApp','tracks.db')

conn = sqlite3.connect(db_path)
c = conn.cursor()
c.execute("delete from tracks;")
conn.commit()
conn.close()
