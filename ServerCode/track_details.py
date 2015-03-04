import os
from mutagen.id3 import ID3



class TrackDetails:
    def __init__(self, title, artist, album, url):

        self.title = title
        self.artist = artist
        self.album = album
        self.filepath = url
        self.album_art = "fyp.matthewoneill.com/images/default.png"


    def set_album_art(url):
        self.album_art = url


def get_album(filepath):
    track = ID3(filepath)
    return track['TALB'].text[0]


def get_artist_and_track_names(filepath):
    track = ID3(filepath)
    return track['TPE1'].text[0], track['TIT2'].text[0]


def load_from_file(filepath):
    artist, title = get_artist_and_track_names(filepath)
    album = get_album(filepath)
    filename = os.path.split(filepath)[-1]
    path_to_file = os.path.join(artist, album, filename)

    track = TrackDetails(title, artist, album, path_to_file)

    return track
