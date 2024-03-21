using TyPlot

function dft(x)

    N = length(x)   
    # 变换后的结果
    X = zeros(Complex{Float64}, N)
    
    for k = 0:N-1   
        for n = 0:N-1
            X[k+1] += x[n+1] * exp(-2im * π * k * n / N)
        end
        # 归一化
        X[k+1] /= N
    end
    
    return X
end

function fft(x)
    N = length(x)  # 该函数只能适用于N为2的幂次 

    if N == 1
        return x
    else
        
        # 递归
        X_even = fft(x[1:2:end-1])
        X_odd = fft(x[2:2:end])
        
        # 旋转因子
        factor = exp.(-2im * π * (0:N/2-1) ./ N)
        
        return [X_even + factor .* X_odd; X_even - factor .* X_odd] ./ 2 # 每一层都做一次归一化，对每次蝶形运算的N都是2
    end

end


# 正弦信号
Fs = 32  # 采样频率
T = 1 # 信号持续时间
N = T * Fs  # 采样点数量
t = LinRange(0, T, N)
x = sin.(2π * t)

X1 = dft(x)
X2 = fft(x)

# 频率轴
freqs = LinRange(0, Fs/2, div(N, 2) + 1)
# 幅值
amplitudes1 = abs.(X1[1:div(N, 2) + 1])
amplitudes2 = abs.(X2[1:div(N, 2) + 1])

subplot(1,2,1)
plot(freqs, amplitudes1)
xlabel("ω")
ylabel("幅值")
title("DFT")

subplot(1,2,2)
plot(freqs, amplitudes2)
xlabel("ω")
ylabel("幅值")
title("FFT")