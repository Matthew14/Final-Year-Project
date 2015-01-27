import sqlite3

db = 'trackratings.db'
happinessThreashold = 1.8


def storeRanking(filePath, ranking):
    sql = "insert into tracks(happinessRating, path) values (?, ?)"
    conn = sqlite3.connect(db)
    cursor = conn.cursor()
    cursor.execute(sql, (ranking, filePath))

    conn.commit()
    conn.close()


def getTracksByCalmnessAndPositivity(c, p):
    return ['ksfkj']



def getHappyTracks():
    sql = "select path, happinessRating from tracks where happinessRating >= ?"

    conn = sqlite3.connect(db)

    cursor = conn.cursor()

    cursor.execute(sql, (happinessThreashold, ))

    re = cursor.fetchall()
    conn.close()

    return re


def getSadTracks():
    sql = "select path, happinessRating from tracks where happinessRating < ?"
    conn = sqlite3.connect(db)
    cursor = conn.cursor()
    cursor.execute(sql, (happinessThreashold, ))

    re = cursor.fetchall()
    conn.close()

    return re
