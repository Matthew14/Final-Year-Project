import psycopg2
import psycopg2.extras
import config

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


    def add_user(self, username, password_hash, f_name=None, surname=None):
        if self.user_exists(username):
            raise Exception('User {} already exists.'.format(username) )

        conn = self.connect()
        cursor = conn.cursor()
        sql = """INSERT INTO users (username, passwordHash, firstname, surname) VALUES (%s, %s, %s, %s);"""
        cursor.execute(sql, (username, password_hash, f_name, surname))
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

        return user['passwordhash'] == password

##Track Stuff#############

    def store_ranking(self, file_path, ranking):
        sql = "INSERT INTO tracks(happinessRating, path) VALUES (?, ?)"
        conn = self.connect()
        cursor = conn.cursor()
        cursor.execute(sql, (ranking, filePath))

        conn.commit()
        cursor.close()
        conn.close()


    #TODO: REMOVE
    def get_happy_tracks(self):
        sql = "SELECT path, happinessRating FROM tracks WHERE happinessRating >= ?"
        conn = self.connect()
        cursor = conn.cursor()
        cursor.execute(sql, (happinessThreashold, ))
        re = cursor.fetchall()
        cursor.close()
        conn.close()

        return re


    #TODO:  Remove me
    def get_sad_tracks(self):
        sql = "SELECT path, happinessRating FROM tracks WHERE happinessRating < ?"
        conn = self.connect()
        cursor = conn.cursor()
        cursor.execute(sql, (happinessThreashold, ))

        re = cursor.fetchall()
        cursor.close()
        conn.close()

        return re


    def get_tracks_by_calmness_and_positivity(c, p, threashold=5):
        sql = "SELECT track, artist, path FROM tracks WHERE c <= ? and "


        conn = self.connect()
        cursor = conn.cursor()

        cursor.close()
        conn.close()

        return ['ksfkj']


if __name__ == '__main__':
    p = Postgres()
