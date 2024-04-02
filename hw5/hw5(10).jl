# 线性线性调频交叉谱图 
using TyMath
using TySignalProcessing
using TyPlot
using TyControlSystems
nSamp = 10000
Fs = 1000e3
SNR = 40
t = [0:(nSamp - 1);] ./ Fs

rng = MT19937ar(1234)
x1 = chirp(t, 150e3, t[end], 350e3)
x1 = x1 + randn(rng, size(x1)) * std(x1) / db2mag(SNR)

x2 = chirp(t, 200e3, t[end], 300e3)
x2 = x2 + randn(rng, size(x2)) * std(x2) / db2mag(SNR)

figure()
xspectrogram(x1, x2, hamming(200), 80, 1024, Fs, "yaxis"; plotfig=true)

x2 = chirp(t, 50e3, t[end], 350e3)
x2 = x2 + randn(rng, size(x2)) * std(x2) / db2mag(SNR)

figure()
xspectrogram(x1, x2, kaiser(500, 5), 450, 256, Fs, "yaxis"; plotfig=true)
