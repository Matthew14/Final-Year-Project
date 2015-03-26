import json
import urllib2
import sys
sys.path.append('..')
import time
import track_details
from lyric_analysis import LyricAnalyser
from pg_db import Postgres
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

        try:
            self.lyrics_positivity = self.get_lyric_positivity()
        except:
            self.lyrics_positivity = 0


    def get_lyric_positivity(self):
        return self.lyric_analyser.get_lyric_positivity(self.artist, self.title)


    def get_positivity(self):
        score = 0
        score += self.mode  # 0=minor, 1=major
        score += self.lyrics_positivity / 10
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
    return track_details.get_artist_and_track_names(filePath)


def get_echonest_track(artist, track):
    urlToGet = echonestURL.format(artist, track)
    jsonString = read_url(urlToGet)
    trackJson = json.loads(jsonString)

    try:
        trackSummary = trackJson['response']['songs'][0]['audio_summary']
    except:
        return None

    lyric_analyser = LyricAnalyser()

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


def rank_track(track):
    p = Postgres()
    en_track = get_echonest_track(track.artist, track.title)
    p.store_ranking(track, en_track.get_excitedness(), en_track.get_positivity())


def re_rank_track(track):
    p = Postgres()
    en_track = get_echonest_track(track.artist, track.title)
    p.update_ranking(track, en_track.get_excitedness(), en_track.get_positivity())


def readTracksFromFile(path):
    artistAndTracks = []
    with open(path, 'r') as f:
        for line in f.readlines():
            s = line.split('-')
            artistAndTracks.append((s[0].strip(), s[1].strip()))

    return artistAndTracks


def rank_tracks_in_directory(directory):
    for root, dirs, files in os.walk(directory, topdown=False):
        print root

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
