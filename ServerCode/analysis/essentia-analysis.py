import sys
import essentia
import os
import sys
from essentia.streaming import *


class EssentiaAnalyser(object):
    
    def load_track(self, file_path):
        pass


def get_log_attack_time():
    pass


def get_bpm(audiofile):
    pool = essentia.Pool()

    loader = MonoLoader(filename = audiofile)
    bt = RhythmExtractor2013()
    bpm_histogram = BpmHistogramDescriptors()
    centroid = Centroid(range=250) # BPM histogram output size is 250

    loader.audio >> bt.signal
    bt.bpm >> (pool, 'bpm')
    bt.ticks >> None
    bt.confidence >> None
    bt.estimates >> None
    bt.bpmIntervals >> bpm_histogram.bpmIntervals
    bpm_histogram.firstPeakBPM >> (pool, 'bpm_first_peak')
    bpm_histogram.firstPeakWeight >> None
    bpm_histogram.firstPeakSpread >> None
    bpm_histogram.secondPeakBPM >> (pool, 'bpm_second_peak')
    bpm_histogram.secondPeakWeight >> None
    bpm_histogram.secondPeakSpread >> None
    


    essentia.run(loader)

    return "BPM:", pool['bpm']


def get_dissonance(audiofile):
    
    diss = Dissonance()    

    essentia.run(diss)
    pool = essentia.Pool()


def main():

#    if len(sys.argv) < 2 or not  os.path.isfile(sys.argv[1]) :
 #       print "no input file specified"
  #      sys.exit(1)

   # fname = print sys.argv[1]
    pass



if __name__ == "__main__":
    main()
