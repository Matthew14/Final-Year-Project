import json
import urllib2
import dbAccess
import time
from xml.dom import minidom
from mutagen.id3 import ID3


echonestURL = '\
http://developer.echonest.com/api/v4/song/search?\
api_key=ZJ0COFVRGKX9H3MXE&\
artist={}&\
title={}&\
bucket=audio_summary'


class EchoNestTrack(object):
    def __init__(self, energy, key, loudness, mode, tempo, danceability, lyrics):
        self.energy = energy
        self.key = key
        self.loudness = loudness
        self.mode = mode
        self.tempo = tempo
        self.lyrics = lyrics
        self.danceability = danceability

    def getHappinessScore(self):
        score = 0
        score += self.mode  # 0=minor, 1=major
        score += self.energy
        score += self.danceability
        return score


def getArtistAndTrackNames(filePath):
    track = ID3(filePath)
    return track['TPE1'].text[0], track['TIT2'].text[0]


def readURL(url):
    url = url.replace(' ', '%20')

    # print "getting " + url
    return urllib2.urlopen(url).read()


def getLyrics(artist, track):
    searchUrl = "http://api.chartlyrics.com/apiv1.asmx/SearchLyricDirect?artist={}&song={}"
    searchUrl = searchUrl.format(artist, track)

    xml = minidom.parseString(readURL(searchUrl))
    res = xml.getElementsByTagName("GetLyricResult")[0]
    lyrics = res.getElementsByTagName("Lyric")[0].childNodes[0].data

    return lyrics


def getEchonestData(artist, track):
    urlToGet = echonestURL.format(artist, track)
    jsonString = readURL(urlToGet)
    trackJson = json.loads(jsonString)
    print jsonString
    trackSummary = trackJson['response']['songs'][0]['audio_summary']

    enTrack = EchoNestTrack(
        trackSummary['energy'],
        trackSummary['key'],
        trackSummary['loudness'],
        trackSummary['mode'],
        trackSummary['tempo'],
        trackSummary['danceability'],
        '')
        # getLyrics(artist, track))

    return enTrack.getHappinessScore()


def rankTrackByInfo(artist, track):
    return getEchonestData(artist, track)


def rankTrack(filePath):
    artist, track = getArtistAndTrackNames(filePath)
    dbAccess.storeRanking(filePath, getEchonestData(artist, track))


def readTracksFromFile(path):

    artistAndTracks = []
    with open(path, 'r') as f:
        for line in f.readlines():
            s = line.split('-')
            artistAndTracks.append((s[0].strip(), s[1].strip()))

    return artistAndTracks

if __name__ == '__main__':
    # f = r'D:\Music\Radiohead\Ok Computer\Radiohead - No Surprises.mp3'
    # f = r'D:\Music\Low\Low- I Could Live In Hope\06 Lullaby.mp3'
    # f = r'D:\Music\Katrina & The Waves - Walking on sunshine (Greatest hits)\01. Walking on sunshine.mp3'
    # rankTrack(f)

    # happyRankings = []
    # for a, t in readTracksFromFile("happyTracksGenius.txt"):

    #     try:
    #         happyRankings.append(rankTrackByInfo(a, t))
    #     except:
    #         print "couldn't do {} by {}".format(t, a)
    #     time.sleep(.5)

    # sadRankings = []
    # for a, t in readTracksFromFile("sadTracksGenius.txt"):

    #     try:
    #         sadRankings.append(rankTrackByInfo(a, t))
    #     except:
    #         print "couldn't do {} by {}".format(t, a)
    #     time.sleep(.5)

    # print "happy: "
    # print "I'm walking on sunshine: " + str(rankTrackByInfo('Katrina and The Waves', 'walking on sunshine'))
    # print happyRankings
    # print "\n\nsad: "
    print "Lullaby: " + str(rankTrackByInfo('low', 'Lullaby'))
    # print sadRankings
