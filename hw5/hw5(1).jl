# 频谱图的默认值

using TySignalProcessing
using TyPlot
using TyMath
N = 1024
n = 0:(N - 1)

w0 = 2 * pi / 5
x = @. sin(w0 * n) + 10 * sin(2 * w0 * n);
s, = spectrogram(x)

figure()
spectrogram(x, "yaxis"; plotfig=true)
