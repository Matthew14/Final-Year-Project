import pylast

api_key = 'eb1f248f2a3dd23c0d321448d1b74c8a'
api_secret = 'bfd72e05278afbd59b4b27e62036a115'

network = pylast.LastFMNetwork(api_key = api_key, api_secret = api_secret)


def get_artwork(artist, album):
    return pylast.Album(artist, album, network).get_cover_image()
