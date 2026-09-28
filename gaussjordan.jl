# Nomes:Gabriel Perrout e Vitor de Oliveira Silva

function gauss_pivot(A, b)

    n = length(b)

    # Matriz aumentada
    mat = Float64.(hcat(A, b))

    # Eliminação gaussiana com pivoteamento parcial
    for k in 1:n-1

        # Encontra a linha com maior pivô
        linha_pivo = k

        for i in k+1:n
            if abs(mat[i,k]) > abs(mat[linha_pivo,k])
                linha_pivo = i
            end
        end

        # Troca as linhas
        mat[k, :], mat[linha_pivo, :] =
            copy(mat[linha_pivo, :]), copy(mat[k, :])

        # Eliminação abaixo do pivô
        for i in k+1:n

            fator = mat[i,k] / mat[k,k]

            for j in k:n+1
                mat[i,j] = mat[i,j] - fator * mat[k,j]
            end

        end
    end

    # Substituição regressiva
    x = zeros(Float64, n)

    for i in n:-1:1

        soma = 0.0

        for j in i+1:n
            soma += mat[i,j] * x[j]
        end

        x[i] = (mat[i,n+1] - soma) / mat[i,i]
    end

    return x
end


# Teste
A = [2 1 -1;
     -3 -1 2;
     -2 1 2]

b = [8, -11, -3]

x = gauss_pivot(A, b)

println("Solução: ", x)