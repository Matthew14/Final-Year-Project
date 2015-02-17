from xml.dom import minidom
from utils import readURL


def __get_lyrics(artist, track):
    searchUrl = "http://api.chartlyrics.com/apiv1.asmx/SearchLyricDirect?artist={}&song={}"
    searchUrl = searchUrl.format(artist, track)
       
    xml = minidom.parseString(readURL(searchUrl))
    res = xml.getElementsByTagName("GetLyricResult")[0]
    lyrics = res.getElementsByTagName("Lyric")[0].childNodes[0].data
        
    return str(lyrics)


def __load_words_from_file(fp):
    with open(fp, 'r') as f:
        lines = [line.strip() for line in f.readlines() if ';' not in line]
        return lines       


def __get_negative_words():
    return __load_words_from_file('negative-words.txt')


def __get_positive_words():
    return __load_words_from_file('positive-words.txt')


def __words_positivity(s):
    positivity = 0
    
    negative_words = __get_negative_words()
    positive_words = __get_positive_words()

    words = s.split(' ') 
    
    for word in [n for n in negative_words if n in words]:
        positivity -= 1
 
    for word in [p for p in positive_words if p in words]:
        positivity += 1
    
    return positivity


def get_lyric_positivity(artist, track):
    lyrics = __get_lyrics(artist, track)
    return __words_positivity(lyrics)


if __name__ == "__main__":
    print get_lyric_positivity("Katrina and the Waves", "I'm walking on sunshine")
