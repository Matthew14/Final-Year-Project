import urllib2

def readURL(url):
    url = url.replace(' ', '%20')
    return urllib2.urlopen(url).read()
