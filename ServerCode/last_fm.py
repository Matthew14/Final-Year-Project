import pylast

api_key = config.lastfm_api_key
api_secret = config.lastfm_api_secret

network = pylast.LastFMNetwork(api_key = api_key, api_secret = api_secret)


def get_artwork(artist, album):
    return pylast.Album(artist, album, network).get_cover_image()
