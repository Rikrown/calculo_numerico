# Função que implementa o método iterativo de Jacobi
#
# A  -> matriz dos coeficientes
# b  -> vetor dos termos independentes
# x0 -> chute inicial
# tol -> tolerância usada no critério de parada
# maxiter -> número máximo de iterações permitidas
#
# Retorna:
# x -> solução aproximada
# k -> número de iterações realizadas
function jacobi(A, b, x0, tol, maxiter)

    # Número de equações do sistema
    n = length(b)

    # Faz uma cópia do chute inicial.
    # A variável x representa a solução da iteração atual.
    x = copy(x0)

    # Repete o processo no máximo maxiter vezes
    for k in 1:maxiter

        # Cria um novo vetor para armazenar
        # os valores calculados na próxima iteração.
        xnovo = zeros(n)

        # Calcula cada componente de xnovo
        for i in 1:n

            # Variável que vai armazenar a soma:
            #
            # A[i,1]*x[1] + A[i,2]*x[2] + ...
            #
            # sem incluir A[i,i]*x[i].
            soma = 0.0

            # Percorre todas as colunas da linha i
            for j in 1:n

                # Não usamos o elemento da diagonal principal,
                # pois ele será usado para dividir no final.
                if j != i

                    # Acumula A[i,j] * x[j]
                    soma += A[i, j] * x[j]
                end
            end

            # Calcula o novo valor de x[i].
            #
            # Fórmula do método de Jacobi:
            #
            # x_i^(k+1) =
            # (b_i - soma) / A[i,i]
            xnovo[i] = (b[i] - soma) / A[i, i]
        end

        # Calcula a maior diferença entre os valores
        # da nova iteração e da iteração anterior.
        #
        # abs.(...) calcula o valor absoluto de cada diferença.
        # maximum(...) pega a maior dessas diferenças.
        erro = maximum(abs.(xnovo - x))

        # Verifica o critério de parada.
        #
        # Se a maior diferença entre duas iterações
        # consecutivas for menor que a tolerância,
        # consideramos que o método convergiu.
        if erro < tol

            # Retorna a solução aproximada
            # e o número de iterações realizadas.
            return xnovo, k
        end

        # Se ainda não convergiu,
        # a nova solução passa a ser a solução atual
        # para a próxima iteração.
        x = xnovo
    end

    # Se chegar aqui, o método atingiu maxiter
    # sem satisfazer o critério de tolerância.
    #
    # Retorna a última aproximação e maxiter.
    return x, maxiter
end


# ---------------------------------------------------------
# TESTE DO MÉTODO
# ---------------------------------------------------------

# Matriz A do sistema linear
A = [10.0 -1.0  2.0;
     -1.0 11.0 -1.0;
      2.0 -1.0 10.0]

# Vetor b
b = [11.0, 9.0, 11.0]

# Chute inicial
x0 = [0.0, 0.0, 0.0]

# Executa o método de Jacobi
#
# tol = 10^-6
# maxiter = 100
x, iter = jacobi(A, b, x0, 1e-6, 100)

# Mostra a solução encontrada
println("Solução aproximada: ", x)

# Mostra quantas iterações foram necessárias
println("Número de iterações: ", iter)