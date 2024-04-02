# 复信号交叉谱图

using TyMath
using TySignalProcessing
using TyPlot
fs = 3000
t = 0:(1 / fs):(1 - 1 / fs)
rng = MT19937ar(1234)
x1 = chirp(t, 300, t[end], 1300, "quadratic") + randn(rng, size(t)) / 100

x2 = exp.(2im * pi * 100 * cos.(2 * pi * 2 * t)) + randn(rng, size(t)) / 100

nwin = 256

figure()
xspectrogram(x1, x2, kaiser(nwin, 30), nwin - 1, [], fs, "centered", "yaxis"; plotfig=true)

figure()
xspectrogram(
    x1,
    x2,
    kaiser(nwin, 30),
    nwin - 1,
    [],
    fs,
    "power",
    "MinThreshold",
    -40,
    "yaxis";
    plotfig=true,
)
title("Cross-Spectrogram of Quadratic Chirp and Complex Chirp")
