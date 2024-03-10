using TyPlot

global T = 2
global E = 1
global τ = 0.5
global α = 1

# 定义单边指数信号
function single_sided_exp(t)
    return exp.(-α .* t) .* (t .>= 0)
end

# 定义双边指数信号
function double_sided_exp(t)
    return exp.(-α .* abs.(t))
end

# 定义对称矩形脉冲信号
function symmetric_rectangular_pulse(t)
    return E * ((t .>= -τ/2) .& (t .< τ/2))
end

function sinc(t)
    if t == 0
        return 1
    else
        return sin(t)/t
    end
end

# 单边指数信号
function F1(ω)
    return 1 / (α^2 + ω^2)^0.5
end

# 双边指数信号
function F2(ω)
    return 2 * α / (α^2 + ω^2)
end

# 对称矩形脉冲信号
function F3(ω)
    return E * τ * sinc(ω*τ/2)
end

t = -3 : 0.05 : 3
ω = -50 : 0.05 : 50

single = single_sided_exp.(t)
double = double_sided_exp.(t)
symmetric = symmetric_rectangular_pulse.(t)

single1 = F1.(ω)
double1 = F2.(ω)
symmetric1 = F3.(ω) 

subplot(3,3,1)
TyPlot.plot(t, single)
xlabel("t")
ylabel("f(t)")
title("单边指数信号")

subplot(3,3,2)
TyPlot.plot(t, double)
xlabel("t")
ylabel("f(t)")
title("双边指数信号")

subplot(3,3,3)
TyPlot.plot(t, symmetric)
xlabel("t")
ylabel("f(t)")
title("对称矩形脉冲信号")

subplot(3,3,4)
TyPlot.plot(ω, single1)
xlabel("ω")
ylabel("F(jω)")


subplot(3,3,5)
TyPlot.plot(ω, double1)
xlabel("ω")
ylabel("F(jω)")


subplot(3,3,6)
TyPlot.plot(ω, symmetric1)
xlabel("ω")
ylabel("F(jω)")

subplot(3,3,7)
TyPlot.plot(ω, abs.(single1))
xlabel("ω")
ylabel(raw"$\|F(jω)\|$")
subplot(3,3,8)
TyPlot.plot(ω, abs.(double1))
xlabel("ω")
ylabel(raw"$\|F(jω)\|$")
subplot(3,3,9)
TyPlot.plot(ω, abs.(symmetric1))
xlabel("ω")
ylabel(raw"$\|F(jω)\|$")



