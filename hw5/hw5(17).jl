using TySignalProcessing

# 检查 Root-Hann 窗口的 COLA 合规性

win = sqrt.(hann(120,"periodic"))
noverlap = 60

b, = iscola(win,noverlap)

# 检查 Hamming 窗的 COLA 合规性

window = hamming(256,"periodic")
method = "ola"
noverlap = 128

a,m,maxDeviation =  iscola(window,noverlap,method)

b,a,m,maxDeviation
