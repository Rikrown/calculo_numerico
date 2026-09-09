f(x) = exp(-0.1x) + x^2 - 10
df(x) = -0.1 * exp(-0.1x) + 2x

a = -2
b = -3
k = 0

x = (a + b) / 2
x_novo = x - f(x) / df(x)

while true
    global k += 1
    global x_novo = x - f(x) / df(x)

    if abs(x_novo - x) < 10 ^ -5
        global x = x_novo
        break
    end

    global x = x_novo
end

valor = f(x)
println("Raiz: ",x)
println("Valor: ",valor)
println("Interações: ",k)
