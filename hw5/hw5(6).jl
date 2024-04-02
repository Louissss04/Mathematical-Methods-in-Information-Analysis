# 二次线性调频的重新分配频谱图

using TySignalProcessing
using TyPlot
Fs = 1000
t = 0:(1 / Fs):2
y = chirp(t, 100, 1, 200, "quadratic")

figure()
spectrogram(y, kaiser(128, 18), 120, 128, Fs, "reassigned", "yaxis"; plotfig=true)
