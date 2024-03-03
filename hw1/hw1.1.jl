using TyPlot

t = -3 : 0.05 : 3

# 直流信号
dc = ones(length(t))

# 正弦信号
Sin = sin.(t)

# 阶跃信号
step = zeros(length(t))
step[t .>= 0] .= 1

# 指数信号
Exp = 2exp.(-0.5(t.+ 3))

# 绘制图形
subplot(2, 2, 1)
plot(t, dc)
xlabel("t")
ylabel("f(t)")
title("直流信号")
axis([-3, 3, -1, 2])

subplot(2, 2, 2)
plot(t, Sin)
xlabel("t")
ylabel("f(t)")
title("正弦信号")
axis([-3, 3, -2, 2])

subplot(2, 2, 3)
plot(t, step)
xlabel("t")
ylabel("f(t)")
title("阶跃信号")
axis([-3, 3, -0.5, 1.5])

subplot(2, 2, 4)
plot(t, Exp)
xlabel("t")
ylabel("f(t)")
title("指数信号")
axis([-3, 3, 0, 2.5])
