# Nomes:Gabriel Perrout e Vitor de Oliveira Silva

function secante(f, x0, x1, tol, maxiter)

    k = 0
    x_anterior = x0
    x_atual = x1

    while k < maxiter

        x_novo = (x_anterior * f(x_atual) - x_atual * f(x_anterior)) /
                 (f(x_atual) - f(x_anterior))

        k += 1

        if abs(x_novo - x_atual) < tol
            x_atual = x_novo
            break
        end

        x_anterior = x_atual
        x_atual = x_novo
    end

    return x_atual, k
end


# Função do exercício
f(x) = x^3 - x - 2

# Valores iniciais
x0 = 1
x1 = 2

# Tolerância e máximo de iterações
tol = 10^-5
maxiter = 100

# Chamada da função
raiz, iteracoes = secante(f, x0, x1, tol, maxiter)

println("Raiz aproximada: ", raiz)
println("Iterações: ", iteracoes)
println("Valor de f(raiz): ", f(raiz))