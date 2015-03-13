import os
import psycopg2
import sys
sys.path.append('..')
import track_details


db = 'fyp'
user, password = ('dev', 'devPass') if os.name == 'nt' else ('fypuser', 'fypPass')
host = 'localhost'


conn_string = "dbname='{}' user='{}' host='{}' password='{}'".format(db, user, host, password)
conn = psycopg2.connect(conn_string)
cursor = conn.cursor()

cursor.execute("SELECT file_path FROM tracks")

for row in list(cursor.fetchall()):
    track = track_details.load_from_file(os.path.join('uploads', row[0])
    cursor.execute("update tracks set duration = %s where file_path = %s", (row[0],))


conn.commit()
cursor.close()
conn.close()
