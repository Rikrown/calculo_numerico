f(xnovo) = sqrt(6 - xnovo)

xnovo = 1.5
xvelho = 0

while abs(xnovo - xvelho) > 0.01
    f(xnovo)
    global xvelho = xnovo
    global xnovo = f(xnovo)
end

println(xnovo)
