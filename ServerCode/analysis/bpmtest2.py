import sys

from essentia.streaming import *
pool = essentia.Pool()

loader = MonoLoader(filename = sys.argv[1])
frame_cutter = FrameCutter(frameSize = 2048, hopSize = 128)
w = Windowing(type = 'hann')
spec = Spectrum()
frequency_bands = FrequencyBands()
novelty_curve = NoveltyCurve()
bpm_histogram = BpmHistogram()

loader.audio >> frame_cutter.signal
frame_cutter.frame >> w.frame >> spec.frame
spec.spectrum >> frequency_bands.spectrum
frequency_bands.bands >> novelty_curve.frequencyBands 
novelty_curve.novelty >> bpm_histogram.novelty 

novelty_curve.novelty >> (pool, 'novelty')
bpm_histogram.bpm >> (pool, 'bpm_histogram.bpm')
bpm_histogram.bpmCandidates >> (pool, 'bpm_histogram.bpmCandidates')
bpm_histogram.bpmMagnitudes >> (pool, 'bpm_histogram.bpmMagnitudes')
bpm_histogram.tempogram >> (pool, 'bpm_histogram.tempogram')
bpm_histogram.frameBpms >> (pool, 'bpm_histogram.frameBpms')
bpm_histogram.ticks >> (pool, 'bpm_histogram.ticks')
bpm_histogram.ticksMagnitude >> (pool, 'bpm_histogram.ticksMagnitude')
bpm_histogram.sinusoid >> (pool, 'bpm_histogram.sinusoid')

essentia.run(loader)
print pool['bpm_histogram.bpm']
