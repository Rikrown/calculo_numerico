f(x) = exp(-0.1x) + x^2 - 10

xvelho = -2
xnovo = -3
xatual = -2.5
k = 0

while abs(xatual - xvelho) > 10 ^ -5
    global xnovo = ( xvelho * f(xatual) - xatual * f(xvelho) ) / ( f(xatual) - f(xvelho) )
    global xvelho = xatual
    global xatual = xnovo
    global k += 1
end

println("Iterações: ",k)
println(xnovo)