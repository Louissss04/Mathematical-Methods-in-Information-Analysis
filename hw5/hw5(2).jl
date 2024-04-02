# 沿x轴的频率

using TySignalProcessing
using TyPlot
t = 0:0.001:2
x = chirp(t, 100, 1, 200, "quadratic")

# 将信号划分为长度为 128 的段落，并使用汉明窗口。
figure()
spectrogram(x, 128, 120, 128, 1e3; plotfig=true)

# 用 Blackman 窗口取代汉明窗口。将重叠减少到 60 个样本。绘制时间轴，使其数值从上到下递增
figure()
spectrogram(x, blackman(128), 60, 128, 1e3; plotfig=true)
gca().set_ylim(reverse(ylim()))
