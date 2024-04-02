# 扫频余弦信号 STFT

using TyPlot 
using TyBase
using TySignalProcessing

ts = [0:1/1e3:2;]
f0 = 100
f1 = 200
x = chirp(ts,f0,1,f1,"quadratic")

d = 1e-3
win = hamming(100,"periodic")
x,f,t = stft(x,d;Window=win,OverlapLength=98,FFTLength=128)
T,F = meshgrid2(t,f)
m = surf(F,T,abs.(x))
colorbar(gca(),m)
plt_view(2)
