import urllib2

url = 'http://developer.echonest.com/api/v4/song/search?api_key=ZJ0COFVRGKX9H3MXE&artist=radiohead&title=Idioteque&bucket=audio_summary'

v = urllib2.urlopen(url)

print v.read()
