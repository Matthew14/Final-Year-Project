import json
import urllib2
import sys
sys.path.append('..')
import dbAccess
import time
from lyric_analysis import LyricAnalyser
from mutagen.id3 import ID3
from utils import read_url


echonestURL = '\
http://developer.echonest.com/api/v4/song/search?\
api_key=ZJ0COFVRGKX9H3MXE&\
artist={}&\
title={}&\
bucket=audio_summary'


class Track(object):
    def __init__(self, artist, title, energy, key, loudness, mode, tempo, danceability, lyric_analyser):
        self.lyric_analyser = lyric_analyser
        
        self.artist = artist
        self.title = title
        
        self.energy = energy
        self.key = key
        self.loudness = loudness
        self.mode = mode
        self.tempo = tempo
        self.danceability = danceability
        self.lyrics_positivity = self.get_lyric_positivity()

    
    def get_lyric_positivity(self):
        return self.lyric_analyser.get_lyric_positivity(self.artist, self.title)    
   
    
    def get_positivity(self):
        score = 0
        score += self.mode  # 0=minor, 1=major
        score += self.lyrics_positivity
        return score
    

    def get_excitedness(self):
        score = 0
        score += (self.tempo-120)*.1
        score += self.energy * 10
        score += self.danceability*10
        score += self.loudness*.1
        return score

    
    def get_happiness_score(self):
        score = 0
        score += self.mode  # 0=minor, 1=major
        score += self.energy
        score += self.danceability
        return score


def getArtistAndTrackNames(filePath):
    track = ID3(filePath)
    return track['TPE1'].text[0], track['TIT2'].text[0]


def getEchonestTrack(artist, track):
    urlToGet = echonestURL.format(artist, track)
    jsonString = read_url(urlToGet)
    trackJson = json.loads(jsonString)
    trackSummary = trackJson['response']['songs'][0]['audio_summary']

    enTrack = Track(
        artist, 
        track,
        trackSummary['energy'],
        trackSummary['key'],
        trackSummary['loudness'],
        trackSummary['mode'],
        trackSummary['tempo'],
        trackSummary['danceability'],
        lyric_analyser)

    return enTrack


def rankTrackByInfo(artist, track):
    track = getEchonestTrack(artist, track)
    return track.get_positivity(), track.get_excitedness()


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

    global lyric_analyser 
    lyric_analyser = LyricAnalyser()
    

    happyRankings = []
    for a, t in readTracksFromFile("spotify-low-lullaby.txt"):
        try:
            happyRankings.append(rankTrackByInfo(a, t))
        except:
            print "couldn't do {} by {}".format(t, a)
        time.sleep(.5)

    
    print happyRankings
    
    #sadRankings = []
    #for a, t in readTracksFromFile("sadTracksGenius.txt"):

    #     try:
    #         sadRankings.append(rankTrackByInfo(a, t))
    #     except:
    #         print "couldn't do {} by {}".format(t, a)
    #     time.sleep(.5)

    # print "happy: "
    #print "I'm walking on sunshine: " + str(rankTrackByInfo('Katrina and The Waves', 'walking on sunshine'))
    # print "\n\nsad: "
    #print "Lullaby: " + str(rankTrackByInfo('low', 'Lullaby'))
    # print sadRankings