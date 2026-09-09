f(x) = exp(-0.1x) + x ^ 2 - 10

a = 2.5
b = 3.5
k = 0

fa = f(a)
fb = f(b)

while abs(b - a) > 10 ^ -5
    x = (a + b) / 2
    fx = f(x)
    if(fa * fx < 0)
        global b = x
        global fb = fx
    elseif (fb * fx < 0)
        global a = x
        global fa = fx
    end
    global k += 1
end
raiz = (a+b)/2
valor = f(raiz)

println(a, " ", b)
println("raiz aproximada: ",raiz)
println("Valor: ",valor)
println("Interações: ",k)