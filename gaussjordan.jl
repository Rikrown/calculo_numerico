mat = Float64.([3 2 4 1; 1 1 2 2; 4 3 -2 3])

fator = mat[2,1] / mat[1,1]
for i in 1:4
   mat[2,i] = mat[2,i] - mat[1,i]*fator
   if abs(mat[2,i]) < 10 ^ -5
    mat[2,i] = 0
   end
end
println(mat[2,1], " ", mat[2,2], " ", mat[2,3], " ", mat[2,4])

fator = mat[3,1] / mat[1,1]
for i in 1:4
   mat[3,i] = mat[3,i] - mat[1,i]*fator
   if abs(mat[3,i]) < 10 ^ -5
    mat[3,i] = 0
   end
end
println(mat[3,1], " ", mat[3,2], " ", mat[3,3], " ", mat[3,4])

fator = mat[1,2] / mat[2,2]
for i in 1:4
   mat[1,i] = mat[1,i] - mat[2,i]*fator
   if abs(mat[1,i]) < 10 ^ -5
    mat[1,i] = 0
   end
end
println(mat[1,1], " ", mat[1,2], " ", mat[1,3], " ", mat[1,4])

fator = mat[3,2] / mat[2,2]
for i in 1:4
   mat[3,i] = mat[3,i] - mat[2,i]*fator
   if abs(mat[3,i]) < 10 ^ -5
    mat[3,i] = 0
   end
end
println(mat[3,1], " ", mat[3,2], " ", mat[3,3], " ", mat[3,4])

fator = mat[1,3] / mat[3,3]
for i in 1:4
   mat[1,i] = mat[1,i] - mat[3,i]*fator
   if abs(mat[1,i]) < 10 ^ -5
    mat[1,i] = 0
   end
end
println(mat[1,1], " ", mat[1,2], " ", mat[1,3], " ", mat[1,4])

fator = mat[2,3] / mat[3,3]
for i in 1:4
   mat[2,i] = mat[2,i] - mat[3,i]*fator
   if abs(mat[2,i]) < 10 ^ -5
    mat[2,i] = 0
   end
end
println(mat[2,1], " ", mat[2,2], " ", mat[2,3], " ", mat[2,4])

fator = mat[1,1]
for i in 1:4
   mat[1,i] = mat[1,i] / fator
   if abs(mat[1,i]) < 10 ^ -5
    mat[1,i] = 0
   end
end
println(mat[1,1], " ", mat[1,2], " ", mat[1,3], " ", mat[1,4])

fator = mat[2,2]
for i in 1:4
   mat[2,i] = mat[2,i] / fator
   if abs(mat[2,i]) < 10 ^ -5
    mat[2,i] = 0
   end
end
println(mat[2,1], " ", mat[2,2], " ", mat[2,3], " ", mat[2,4])

fator = mat[3,3]
for i in 1:4
   mat[3,i] = mat[3,i] / fator
   if abs(mat[3,i]) < 10 ^ -5
    mat[3,i] = 0
   end
end
println(mat[3,1], " ", mat[3,2], " ", mat[3,3], " ", mat[3,4])