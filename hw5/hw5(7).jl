# 带阈值的频谱图

using TySignalProcessing
using TyPlot
Fs = 1000
t = 0:(1 / Fs):2
y = chirp(t, 100, 1, 200, "quadratic")
_, _, _, pxx, fc, tc = spectrogram(y, kaiser(128, 18), 120, 128, Fs, "MinThreshold", -30)
plot(tc[pxx .> 0], fc[pxx .> 0], ".")
