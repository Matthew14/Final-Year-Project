import urllib2

def read_url(url):
    url = url.replace(' ', '%20')
    return urllib2.urlopen(url).read()
