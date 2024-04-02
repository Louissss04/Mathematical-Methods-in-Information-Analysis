# 复信号频谱图

using TySignalProcessing
using TyPlot
N = 512
n = 0:(N - 1)

x = @. exp(1im * pi * sin(8 * n / N) * 32)

scalar, fs, ts = spectrogram(x, 32, 16, 64, "centered")

figure()
spectrogram(x, 32, 16, 64, "centered", "yaxis"; plotfig=true)

# fintv = (-pi + pi / 32):(pi / 32):pi

# vector, fv, tv = spectrogram(x, 32, 16, fintv)

# figure()
# spectrogram(x, 32, 16, fintv, "yaxis"; plotfig=true)
