# 三维频谱图可视化

using TySignalProcessing
using TyPlot
fs = 10e3
t = 0:(1 / fs):2
x1 = vco(sawtooth(2 * pi * t, 0.5), [0.1 0.4] * fs, fs)

figure()
spectrogram(x1, kaiser(256, 5), 220, 512, fs, "yaxis"; plotfig=true)
