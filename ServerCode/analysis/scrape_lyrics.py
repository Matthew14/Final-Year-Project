import urllib2
import bs4
from bs4 import BeautifulSoup


def get_lyrics_from_az(track, artist):
    url ="http://search.azlyrics.com/search.php?q={}"

    track = track.replace(' ', '+')
    artist = artist.replace(' ', '+')

    q = "{}+{}".format(track, artist)
    url = url.format(q)

    request = urllib2.Request(url, headers={ 'User-Agent': 'Mozilla/5.0' })

    html = urllib2.urlopen(request).read()

    soup = BeautifulSoup(html)

    link = soup.find('div', class_="sen")

    if link is not None:
        link = link.find('a')['href']

    if link is None:
        return ""

    html = urllib2.urlopen(link).read()
    soup = BeautifulSoup(html)

    div_contents = [f for f in soup.find_all('div') if 'style' in f.attrs][2].contents

    lyrics = ""

    for l in div_contents:
        if  isinstance(l, bs4.element.NavigableString):
            lyrics = lyrics + " " + l.strip()

    lyrics = lyrics.replace('start of lyrics', '').replace('end of lyrics', '').strip()

    return unicode(lyrics)
