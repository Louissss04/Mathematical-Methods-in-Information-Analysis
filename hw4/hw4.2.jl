using TyPlot

global ω_m = 2

# Sa函数
function sinc(t)
    if t == 0
        return 1
    else
        return sin(t)/t
    end
end

# Sa(2t), ω_s ≥ 2ω_m = 4 Hz
function signal(t)
    return sinc(ω_m * t)
end

# 连续
t_continuous = -5:0.001:5
x_continuous = [signal(t) for t in t_continuous]

subplot(2,3,1)
plot(t_continuous, x_continuous)
xlabel("t")
ylabel("f(t)")
title(raw"原信号$f(t) = \frac{sin(2t)}{2t}$")

# 离散信号 取ω=5
ω1 = 5 
t1 = -5:1/ω1:5
x1 = [signal(t) for t in t1]
n1 = t1 .* ω1

subplot(2,3,2)
scatter(t1, x1, 5)
title(raw"取样率$ω_s = 5$")

function reconstruct1(t)
    return sum(signal.(t1) .* sinc.(ω1 .* (t .- t1) ./2))
end
xrecon1 = [reconstruct1(t) for t in t_continuous]

subplot(2,3,3)
plot(t_continuous, xrecon1)
title("重构信号")

# 离散信号 取ω=2
ω2 = 2
t2 = -5:1/ω2:5
x2 = [signal(t) for t in t2]
n1 = t2 .* ω2

subplot(2,3,5)
scatter(t2, x2, 5)
title(raw"取样率$ω_s = 2$")
function reconstruct2(t)
    return sum(signal.(t2) .* sinc.(ω2 .* (t .- t2) ./2))
end
xrecon2 = [reconstruct2(t) for t in t_continuous]

subplot(2,3,6)
plot(t_continuous, xrecon2)
title("重构信号")



