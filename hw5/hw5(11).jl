# 两个二次线性调频之间的相移

using TySignalProcessing
using TyPlot
fs = 1e3
t = 0:(1 / fs):2

y1 = chirp(t, 100, 1, 200, "quadratic", 0)
y2 = chirp(t, 100, 1, 200, "quadratic", 23)

_, f, xt, c = xspectrogram(y1, y2, kaiser(128, 18), 120, 128, fs)

figure()
xspectrogram(y1, y2, kaiser(128, 18), 120, 128, fs, "yaxis"; plotfig=true)
