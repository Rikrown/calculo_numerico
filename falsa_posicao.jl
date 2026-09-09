f(x) = exp(-0.1x) + x ^ 2 - 10

a = -2
b = -3
k = 0

fa = f(a)
fb = f(b)
fx = 100

while abs(fx) > 10 ^ -5
    x = (a * fb - b * fa) / (fb - fa)
    global fx = f(x)
    if(fa * fx < 0)
        global b = x
        global fb = fx
    elseif (fb * fx < 0)
        global a = x
        global fa = fx
    end
    global k += 1
    println(a, " ", b, " fx=", fx)
end

raiz = (a * fb - b * fa) / (fb - fa)
valor = f(raiz)

println(a, " ", b)
println("raiz aproximada: ",raiz)
println("Valor: ",valor)
println("Interações: ",k)
