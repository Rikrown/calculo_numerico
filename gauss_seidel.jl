# Nomes:Gabriel Perrout e Vitor de Oliveira Silva
# Função que implementa o método de Gauss-Seidel
#
# A       -> matriz dos coeficientes
# b       -> vetor dos termos independentes
# x0      -> chute inicial
# tol     -> tolerância para o critério de parada
# maxiter -> número máximo de iterações
#
# Retorna:
# x    -> solução aproximada
# iter -> número de iterações realizadas
function seidel(A, b, x0, tol, maxiter)

    # Número de equações do sistema
    n = length(b)

    # Copia o chute inicial.
    # x representa a solução da iteração atual.
    x = copy(x0)

    # Executa no máximo maxiter iterações
    for k in 1:maxiter

        # Guarda uma cópia da solução ANTES de começar
        # a atualizá-la.
        #
        # Precisamos dela para calcular o erro no final.
        xanterior = copy(x)

        # Percorre cada equação
        for i in 1:n

            # Soma dos termos que não pertencem à diagonal
            soma = 0.0

            for j in 1:n

                # Ignora o elemento da diagonal A[i,i]
                if j != i

                    # Aqui está a principal diferença
                    # em relação ao método de Jacobi:
                    #
                    # x[j] pode já ter sido atualizado nesta
                    # mesma iteração.
                    soma += A[i, j] * x[j]
                end
            end

            # Calcula o novo valor de x[i].
            #
            # Fórmula de Gauss-Seidel:
            #
            # x_i^(k+1) =
            # (b_i - soma) / A[i,i]
            x[i] = (b[i] - soma) / A[i, i]
        end

        # Calcula a maior diferença entre os valores
        # da iteração atual e da iteração anterior.
        #
        # abs.(...) calcula o valor absoluto de cada diferença.
        # maximum(...) pega a maior diferença.
        erro = maximum(abs.(x - xanterior))

        # Verifica se o erro ficou menor que a tolerância
        if erro < tol

            # Se convergiu, retorna a solução e
            # o número de iterações.
            return x, k
        end
    end

    # Se chegou aqui, atingiu o número máximo
    # de iterações sem atingir a tolerância.
    return x, maxiter
end


# ---------------------------------------------------------
# TESTE
# ---------------------------------------------------------

# Matriz A
A = [10.0 -1.0  2.0;
     -1.0 11.0 -1.0;
      2.0 -1.0 10.0]

# Vetor b
b = [11.0, 9.0, 11.0]

# Chute inicial
x0 = [0.0, 0.0, 0.0]

# Executa Gauss-Seidel
x, iter = seidel(A, b, x0, 1e-6, 100)

# Mostra a solução encontrada
println("Solução aproximada: ", x)

# Mostra o número de iterações
println("Número de iterações: ", iter)