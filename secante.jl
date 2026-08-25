f(x) = x^2 + x - 6

xvelho = 0
xnovo = 1
xatual = 1.5

while abs(xatual - xvelho) > 0.01
    global xnovo = ( xvelho * f(xatual) - xatual * f(xvelho) ) / ( f(xatual) - f(xvelho) )
    global xvelho = xatual
    global xatual = xnovo
end

println(xnovo)