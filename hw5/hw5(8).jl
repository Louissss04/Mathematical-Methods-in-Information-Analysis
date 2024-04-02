# 频谱图重新分配和阈值处理

using TySignalProcessing
using TyPlot
using TyMath
using TyControlSystems

nSamp = 2048
Fs = 1024
t = (0:(nSamp - 1)) / Fs

t1 = t[1:Int(nSamp / 2)]

x11 = @. sin(2 * pi * 400 * t1)
x12 = chirp(t1 .- t1[Int(nSamp / 4)], 150, nSamp / Fs, 1750, "quadratic")
x1 = x11 + x12

t2 = t[Int(nSamp / 2 + 1):nSamp]

x21 = chirp(t2, 400, nSamp / Fs, 100)
x22 = chirp(t2, 550, nSamp / Fs, 250)
x2 = x21 + x22

SNR = 20
rng = MT19937ar(1234)

sig = [x1; x2]

sig = sig + randn(rng, size(sig)) * std(sig) / db2mag(SNR)

nwin = 63
wind = kaiser(nwin, 17)
nlap = nwin - 10
nfft = 256
# 计算并绘制信号频谱图
figure()
spectrogram(sig, wind, nlap, nfft, Fs, "yaxis"; plotfig=true)

# 对频谱图进行阈值处理，将数值小于信噪比的元素置零
figure()
spectrogram(sig, wind, nlap, nfft, Fs, "MinThreshold", -SNR, "yaxis"; plotfig=true)

# 将每个 PSD 估计值重新分配到其能量中心位置。
figure()
spectrogram(sig, wind, nlap, nfft, Fs, "reassigned", "yaxis"; plotfig=true)

# 对重新分配的频谱图进行阈值处理，将值小于信噪比的元素设置为零。
figure()
spectrogram(
    sig, wind, nlap, nfft, Fs, "reassigned", "MinThreshold", -SNR, "yaxis"; plotfig=true
)
