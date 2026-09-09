q(x) = -sqrt(10 - exp(-0.1 * x))

xnovo = -3.0
xvelho = 0.0
k = 0

while abs(xnovo - xvelho) > 10 ^ -5
    global k += 1
    global xvelho = xnovo
    global xnovo = q(xnovo)

end

println("raiz: ",xnovo)
println("iterações: ",k)