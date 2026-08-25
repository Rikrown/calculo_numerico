f(x2) = x2^2 + x2 - 6
df(x2) = 2x2 + 1

x1 = 0
x2 = 100

while abs(x1 - x2) > 0.01
    global x2 = x1                        
    global x1 = x2 - (f(x2)/df(x2)) 
end

println(x1)