import sqlite3
conn = sqlite3.connect('tracks.db')
c = conn.cursor()
c.execute("delete from tracks;")
conn.commit()
conn.close()
