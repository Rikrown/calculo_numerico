# Nomes:Gabriel Perrout e Vitor de Oliveira Silva


function newton(f, df, x0, tol, maxiter)

    x = x0
    k = 0

    while k < maxiter

        x_novo = x - f(x) / df(x)

        k += 1

        if abs(x_novo - x) < tol
            x = x_novo
            break
        end

        x = x_novo
    end

    return x, k
end


# Função do exercício
f(x) = x^3 - x - 2
df(x) = 3x^2 - 1

# Chamada do método
x0 = 1.5
tol = 10^-5
maxiter = 100

raiz, iteracoes = newton(f, df, x0, tol, maxiter)

println("Raiz aproximada: ", raiz)
println("Iterações: ", iteracoes)
println("Valor de f(raiz): ", f(raiz))