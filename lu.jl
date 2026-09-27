mat = Float64.([3 2 4 ; 1 1 2 ; 4 3 -2 ])

matL = Float64.([1 0 0; 0 1 0; 0 0 1])

for y in 1:3 
    for x in 1:3
        if x > y
        fator = mat[x,y] / mat[y,y]
        matL[x,y] = fator
        for i in 1:3
            mat[x,i] = mat[x,i] - mat[y,i]*fator
        if abs(mat[x,i]) < 10 ^ -5
            mat[x,i] = 0
        end
        end 
        end
    end
end


println(mat) 
println(matL)