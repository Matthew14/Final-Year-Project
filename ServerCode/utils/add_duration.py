import os
import socket
import psycopg2
import sys
sys.path.append('..')
import track_details


db = 'fyp'
user, password = ('dev', 'devPass') if socket.gethostname() == 'g50-70' else ('fypuser', 'fypPass')
host = 'localhost'


conn_string = "dbname='{}' user='{}' host='{}' password='{}'".format(db, user, host, password)
conn = psycopg2.connect(conn_string)
cursor = conn.cursor()

cursor.execute("SELECT file_path FROM tracks")

for row in list(cursor.fetchall()):
    fp = row[0]
    full_fp = os.path.join('C:\\users\\matthew\\desktop', 'uploads', fp)
    track = track_details.load_from_file(full_fp)

    cursor.execute("update tracks set duration = %s where file_path = %s", (track.duration, fp))


conn.commit()
cursor.close()
conn.close()
