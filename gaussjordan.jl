mat = Float64.([3 2 4 1; 1 1 2 2; 4 3 -2 3])

for y in 1:3 
    for x in 1:3
        if x != y
        fator = mat[x,y] / mat[y,y]
        for i in 1:4
            mat[x,i] = mat[x,i] - mat[y,i]*fator
        if abs(mat[x,i]) < 10 ^ -5
            mat[x,i] = 0
        end
        end 
        end
    end
end

for x in 1:3
    fator = mat[x,x]
    for i in 1:4
        mat[x,i] = mat[x,i] / fator
        if abs(mat[x,i]) < 10^-5
            mat[x,i] = 0
        end
    end
end

println(mat)