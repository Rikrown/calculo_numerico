f(x) = x * log10(x) - 1

a = 2
b = 3

fa = f(a)
fb = f(b)

while b - a > 0.01
    x = (a + b) / 2
    fx = f(x)
    if(fa * fx < 0)
        global b = x
        global fb = fx
    elseif (fb * fx < 0)
        global a = x
        global fa = fx
    end
end

println(a, " ", b)