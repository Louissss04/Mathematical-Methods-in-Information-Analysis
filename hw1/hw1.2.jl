using TyPlot


t = 0: 0.05π: 5π

# 这里指数应该带负号才是衰减信号
y = exp.( -t / 2.5 ) .* sin.(3t)


TyPlot.plot(t, y)

xlabel("t")
ylabel("f(t)")
title(raw"$f(t) = e^{-\frac{t}{2.5}} \sin 3t $")
axis([0, 5π, -1, 1])



