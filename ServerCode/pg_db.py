import psycopg2
import psycopg2.extras

class Postgres:
    def __init__(self):
        pass


    def connect(self):
        db = 'fyp'
        user = 'dev'
        host = '127.0.0.1'
        password = 'devPass'

        conn_string = "dbname='{}' user='{}' host='{}' password='{}'".format(db, user, host, password)
        conn = psycopg2.connect(conn_string)
        return conn


    def user_exists(self, username):
        conn = self.connect()
        cur = conn.cursor()
        sql = "SELECT * FROM users WHERE username = %s"
        cur.execute(sql, (username,))
        res = cur.fetchall()
        cur.close()
        conn.close()

        return len(res) > 0


    def add_user(self, username, password_hash, f_name=None, surname=None):
        if self.user_exists(username):
            raise Exception('User {} already exists.'.format(username) )


        conn = self.connect()
        cur = conn.cursor()
        sql = """INSERT INTO users (username, passwordHash, firstname, surname) VALUES (%s, %s, %s, %s);"""
        cur.execute(sql, (username, password_hash, f_name, surname))
        conn.commit()
        cur.close()
        conn.close()


    def get_user_as_dict(self, username):
        conn = self.connect()
        cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        sql = 'SELECT * FROM users WHERE username = %s'
        cur.execute(sql, (username, ))
        res = cur.fetchone()

        user = dict(res) if res is not None else None
        return user


    def authenticate(self, username, password):
        if not self.user_exists(username):
            raise Exception('User {} does not exist.'.format(username) )


if __name__ == '__main__':
    p = Postgres()
