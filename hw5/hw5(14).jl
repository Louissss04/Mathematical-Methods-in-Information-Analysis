# 短时傅里叶变换

using TyPlot 
using TyBase
using TySignalProcessing

fs = 10e3
t = 0:1/fs:2
x = vco(sin.(2*pi*t),[0.1 0.4]*fs,fs)

x,f,t = stft(x,fs;Window=kaiser(256,5),OverlapLength=220,FFTLength=512)
T,F = meshgrid2(t,f)
m = surf(F,T,abs.(x))
colorbar(gca(),m)
plt_view(2)
