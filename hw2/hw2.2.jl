using TyPlot

global T = 2
global E = 1
global τ = 0.5

# 定义周期矩形脉冲信号函数
function rectangle_pulse(t)
    if rem.(abs(t), T) .< 0.5 * τ || rem.(abs(t), T) .> T - 0.5 * τ
        return E
    else
        return 0
    end
end

# 定义周期锯齿脉冲信号函数
function sawtooth_pulse(t)
    if mod.(t, T) - 0.5 * T < 0
        return 2 * E * mod.(t, T) / T
    else 
        return 2 * E * mod.(t, T) / T - 2 * E
    end
end

# 定义周期三角脉冲信号函数
function triangle_pulse(t)
    if mod.(t, T) - 0.5 * T < 0
        return E -  2 * E * (mod.(t, T)) / T
    else 
        return E -  2 * E * (mod.(-t, T)) / T
    end
end

function sinc(t)
    if t == 0
        return 1
    else
        return sin(t)/t
    end
end

# 周期矩形脉冲信号
function spec1(t)
    # T = 2
    # E = 1
    # τ = 1
    if t == 0
        return E * τ / T
    else
        return 2 * E * τ * sinc(t * τ / 2) / T 
    end
end

# 周期锯齿脉冲信号
function spec2(n)
    if n == 0
        return 0
    else 
        return E * (-1)^(n+1) / n * π
    end
end

# 周期三角脉冲信号
function spec3(n)
    if n == 0
        return E / 2
    else 
        return 4 * E * (sin(n*π/2))^2 / (n*π)^2
    end
end

t = -3 : 0.05 : 3

rec = rectangle_pulse.(t)
saw = sawtooth_pulse.(t)
tri = triangle_pulse.(t)

ω1 = 2π / T
n = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
ω = ω1 .* n

cn1 = spec1.(ω)  
cn2 = spec2.(n)
cn3 = spec3.(n)

subplot(3,3,1)
TyPlot.plot(t, rec)
xlabel("t")
ylabel("f(t)")
title("周期矩形脉冲信号")

subplot(3,3,2)
TyPlot.plot(t, saw)
xlabel("t")
ylabel("f(t)")
title("周期锯齿脉冲信号")

subplot(3,3,3)
TyPlot.plot(t, tri)
xlabel("t")
ylabel("f(t)")
title("周期三角脉冲信号")

subplot(3,3,4)
TyPlot.bar(ω, cn1, width=0.1)
axis([0, 30, -0.2 , 0.5]);
xlabel("t")
ylabel(raw"$c_n$")

subplot(3,3,7)
TyPlot.bar(ω, abs.(cn1), width=0.1)
axis([0, 30, -0.2 , 0.5]);
xlabel("t")
ylabel(raw"$\|c_n\|$")

subplot(3,3,5)
TyPlot.bar(ω, cn2, width=0.1)
axis([0, 30, -2 , 3.5]);
subplot(3,3,8)
TyPlot.bar(ω, abs.(cn2), width=0.1)
axis([0, 30, 0 , 3.5]);
subplot(3,3,6)
TyPlot.bar(ω, cn3, width=0.1)
axis([0, 30, 0 , 0.6]);
subplot(3,3,9)
TyPlot.bar(ω, abs.(cn3), width=0.1)
axis([0, 30, 0 , 0.6]);