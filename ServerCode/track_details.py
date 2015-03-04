class TrackDetails:
    def __init__(self, title, artist, url):

        self.title = title
        self.artist = artist
        self.filepath = url
        self.album_art = "fyp.matthewoneill.com/images/default.png"


    def set_album_art(url):
        self.album_art = url
