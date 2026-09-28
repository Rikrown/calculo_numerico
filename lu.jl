# Nomes:Gabriel Perrout e Vitor de Oliveira Silva

using LinearAlgebra

function lu_resolve(A, b)

    n = length(b)

    U = Float64.(A)

    L = Matrix{Float64}(I, n, n)

    # Fatoração LU
    for k in 1:n-1

        for i in k+1:n

            fator = U[i,k] / U[k,k]

            L[i,k] = fator

            for j in k:n
                U[i,j] = U[i,j] - fator * U[k,j]
            end

        end
    end

    # Resolve Ly = b
    y = zeros(Float64, n)

    for i in 1:n

        soma = 0.0

        for j in 1:i-1
            soma += L[i,j] * y[j]
        end

        y[i] = b[i] - soma
    end

    # Resolve Ux = y
    x = zeros(Float64, n)

    for i in n:-1:1

        soma = 0.0

        for j in i+1:n
            soma += U[i,j] * x[j]
        end

        x[i] = (y[i] - soma) / U[i,i]
    end

    return x, L, U
end


# Teste
A = [2 1 1;
     4 3 3;
     8 7 9]

b = [4, 10, 24]

x, L, U = lu_resolve(A, b)

println("L = ")
println(L)

println("U = ")
println(U)

println("x = ", x)