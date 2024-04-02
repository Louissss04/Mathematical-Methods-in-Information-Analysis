# 两个序列的交叉谱图

using TyMath
using TySignalProcessing
using TyPlot
N = 4096

rng = MT19937ar(1234)
rx = chirp(0:(N - 1), 0.1 / 2, N, 0.8 / 2, "quadratic", [], "convex") + randn(rng, N) / 100
b1, a1 = cheby2(16, 60, [0.2 0.4], "bandpass", "z")
x, = filter1(real(b1), a1, rx)

ry = chirp(0:(N - 1), 0.9 / 2, N, 0.1 / 2) + randn(rng, N) / 100
b2, a2 = cheby1(16, 1, [0.6 0.8], "bandstop", "z")
y, = filter1(b2, a2, ry)

plot(x)
hold("on")
plot(y .+ 2)

figure()
xspectrogram(x, y, hamming(512), 500, 2048, "yaxis"; plotfig=true)

figure()
xspectrogram(x, y, hamming(512), 500, 2048, "MinThreshold", -50, "yaxis"; plotfig=true)
