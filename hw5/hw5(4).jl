# 频谱图和瞬时频率
using TySignalProcessing
using TyPlot
fs = 1000
t = 0:(1 / fs):(2 - 1 / fs)
y = chirp(t, 100, 1, 200, "quadratic")

figure()
spectrogram(y, 100, 80, 100, fs, "yaxis"; plotfig=true)
