# STFT 频率范围

using TyPlot 
using TyBase
using TySignalProcessing
using TyMath
fs = 5000
t1 = [0:1/fs:4-1/fs;]
x = besselj.(0,600*(sin.(2*pi*(t1.+1).^3/30).^5))
figure()
plot(t1,x)

rngs = ["onesided","twosided","centered"]
figure()
for kj = 1:length(rngs)
y,f,t = stft(x,fs;Window=kaiser(202,10),FrequencyRange=rngs[kj])
T,F = meshgrid2(t,f)
subplot(length(rngs),1,kj)
m = surf(F,T,abs.(y))
colorbar(gca(),m)
title(string(rngs[kj]," [",string(round(f[1]/1000,digits=3)),", ",string(round(f[end]/1000,digits=3)),"] ","kHz"))
end

figure()
for kj = 1:length(rngs)
y,f,t = stft(x,fs;Window=kaiser(203,10),FrequencyRange=rngs[kj])
T,F = meshgrid2(t,f)
subplot(length(rngs),1,kj)
m = surf(F,T,abs.(y))
colorbar(gca(),m)
title(string(rngs[kj]," [",string(round(f[1]/1000,digits=3)),", ",string(round(f[end]/1000,digits=3)),"] ","kHz"))
end
