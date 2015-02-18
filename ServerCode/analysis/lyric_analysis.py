from xml.dom import minidom
from utils import read_url
import time


class LyricAnalyser:

    def __init__(self):
        self.last_accessed = 0


    def __get_lyrics(self, artist, track):
   
        while (time.time() - self.last_accessed) < 20:
            time.sleep(1)
        self.last_accessed = time.time()

        searchUrl = "http://api.chartlyrics.com/apiv1.asmx/SearchLyricDirect?artist={}&song={}"
        searchUrl = searchUrl.format(artist, track)
       
        xml = minidom.parseString(read_url(searchUrl))
        res = xml.getElementsByTagName("GetLyricResult")[0]
        lyrics = res.getElementsByTagName("Lyric")[0].childNodes[0].data
        
        return str(lyrics)


    def __load_words_from_file(self, fp):
        with open(fp, 'r') as f:
            lines = [line.strip() for line in f.readlines() if ';' not in line]
            return lines       


    def __get_negative_words(self):
        return self.__load_words_from_file('negative-words.txt')


    def __get_positive_words(self):
        return self.__load_words_from_file('positive-words.txt')


    def __words_positivity(self, s):
        positivity = 0
    
        negative_words = self.__get_negative_words()
        positive_words = self.__get_positive_words()

        words = s.split(' ') 
    
        for word in [n for n in negative_words if n in words]:
            positivity -= 1
 
        for word in [p for p in positive_words if p in words]:
            positivity += 1
    
        return positivity


    def get_lyric_positivity(self, artist, track):
        lyrics = self.__get_lyrics(artist, track)
        return self.__words_positivity(lyrics)


if __name__ == "__main__":
    l = LyricAnalyser()
    print l.get_lyric_positivity("Katrina and the Waves", "I'm walking on sunshine")
