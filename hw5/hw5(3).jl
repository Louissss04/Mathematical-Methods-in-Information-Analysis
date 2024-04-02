# 线性调频的功率谱密度

using TySignalProcessing
using TyPlot
fs = 1000
t = 0:(1 / fs):2
x = chirp(t, 100, 1, 200, "quadratic")

# 二次线性调频
figure()
spectrogram(x, 128, 120, 128, fs, "yaxis"; plotfig=true)
title("Quadratic Chirp")

# 线性线性调频信号
x = chirp(t, 0, 1, 150)

figure();
spectrogram(x, 256, 250, 256, fs, "yaxis"; plotfig=true);
title("Linear Chirp")

# 对数线性调频
x = chirp(t, 20, 1, 60, "logarithmic")

figure();
spectrogram(x, 256, 250, [], fs, "yaxis"; plotfig=true);
title("Logarithmic Chirp")
gca().set_yscale("log")
gca().set_ylim([4, 500])
gca().set_yscale("linear")

