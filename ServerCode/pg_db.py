import psycopg2
import psycopg2.extras
import config
from track_details import TrackDetails


class Postgres:
    def __init__(self):
        pass


    def connect(self):
        db = config.db_name
        user = config.db_user
        host = config.db_host
        password = config.db_password

        conn_string = "dbname='{}' user='{}' host='{}' password='{}'".format(db, user, host, password)
        conn = psycopg2.connect(conn_string)
        return conn


    def user_exists(self, username):
        conn = self.connect()
        cursor = conn.cursor()
        sql = "SELECT * FROM users WHERE username = %s"
        cursor.execute(sql, (username,))
        res = cursor.fetchall()
        cursor.close()
        conn.close()

        return len(res) > 0


    def add_user(self, username, password_hash, f_name=None, surname=None, email=None):
        if self.user_exists(username):
            raise Exception('User {} already exists.'.format(username) )

        conn = self.connect()
        cursor = conn.cursor()
        sql = """INSERT INTO users (username, password_hash, first_name, surname, email) VALUES (%s, %s, %s, %s, %s);"""

        cursor.execute(sql, (username, password_hash, f_name, surname, email))
        conn.commit()
        cursor.close()
        conn.close()


    def get_user_as_dict(self, username):
        conn = self.connect()
        cursor = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        sql = 'SELECT * FROM users WHERE username = %s'
        cursor.execute(sql, (username, ))
        res = cursor.fetchone()
        user = dict(res) if res is not None else None
        cursor.close()
        conn.close()

        return user


    def authenticate(self, username, password):
        if not self.user_exists(username):
            raise Exception('User {} does not exist.'.format(username))

        user = self.get_user_as_dict(username)

        return user['password_hash'] == password


##Track Stuff#############

    def store_ranking(self, track, excitedness, positivity):
        sql = "INSERT INTO tracks(artist, title, file_path, positivity, excitedness, album_art_url) VALUES (%s, %s, %s, %s, %s, %s)"
        conn = self.connect()
        cursor = conn.cursor()

        cursor.execute(sql, (track.artist, track.title, track.filepath, positivity, excitedness, track.album_art))

        conn.commit()
        cursor.close()
        conn.close()


    #TODO edge case where artist has multiple tracks same name
    def get_track_id(self, artist, title):
        sql = "SELECT id FROM tracks WHERE artist=%s AND title=%s"
        conn = self.connect()
        cursor = conn.cursor()
        cursor.execute(sql, (artist, title))
        result = cursor.fetchone()
        cursor.close()
        conn.close()
        return result


    def associate_track_with_user(self, track, username):
        t_id = self.get_track_id(track.artist, track.title)[0]

        sql = "INSERT INTO user_has_track(username, track_id) VALUES (%s, %s)"

        conn = self.connect()
        cursor = conn.cursor()
        cursor.execute(sql, (username, t_id))
        conn.commit()
        cursor.close()
        conn.close()


    def get_tracks_by_excitedness_and_positivity(self, username, e, p, threashold=15):
        sql = "SELECT id, title, artist, file_path FROM tracks t JOIN user_has_track uht on uht.track_id = t.id WHERE uht.username = %s AND t.excitedness <= %s AND t.excitedness >= %s AND t.positivity <= %s AND t.positivity >= %s "

        conn = self.connect()
        cursor = conn.cursor()

        cursor.execute(sql, (username, e + threashold, e - threashold, p + threashold, p - threashold))
        results = cursor.fetchall()

        cursor.close()
        conn.close()

        tracks = []
        for r in results:
            tracks.append(TrackDetails(r[1], r[2], '', "music/" +   r[3].replace('\\', '/')))

        return tracks


if __name__ == '__main__':
    p = Postgres()
