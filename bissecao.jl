# Nomes:Gabriel Perrout e Vitor de Oliveira Silva

function bissecao(f, a, b, tol, maxiter)

    fa = f(a)
    fb = f(b)

    # Verifica se existe mudança de sinal no intervalo
    if fa * fb > 0
        error("A função não possui mudança de sinal no intervalo.")
    end

    k = 0

    while (b - a) / 2 >= tol && k < maxiter

        x = (a + b) / 2
        fx = f(x)

        if fa * fx < 0
            b = x
            fb = fx
        else
            a = x
            fa = fx
        end

        k += 1
    end

    raiz = (a + b) / 2

    return raiz, k
end


# Função do exercício
f(x) = x^3 - x - 2

# Intervalo
a = 1
b = 2

# Tolerância e máximo de iterações
tol = 10^-5
maxiter = 100

# Chamada da função
raiz, iteracoes = bissecao(f, a, b, tol, maxiter)

println("Raiz aproximada: ", raiz)
println("Iterações: ", iteracoes)
println("Valor de f(raiz): ", f(raiz))
