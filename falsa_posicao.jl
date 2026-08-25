f(x) = x * log10(x) - 1

a = 2
b = 3

fa = f(a)
fb = f(b)
fx = 100

while abs(fx) > 0.01
    x = (a * fb - b * fa) / (fb - fa)
    global fx = f(x)
    if(fa * fx < 0)
        global b = x
        global fb = fx
    elseif (fb * fx < 0)
        global a = x
        global fa = fx
    end
    println(a, " ", b, " fx=", fx)
end
