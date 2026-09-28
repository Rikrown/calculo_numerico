# Nomes:Gabriel Perrout e Vitor de Oliveira Silva
function falsa_posicao(f, a, b, tol, maxiter)

    fa = f(a)
    fb = f(b)

    if fa * fb > 0
        error("A função não possui mudança de sinal no intervalo.")
    end

    k = 0
    x = 0.0
    fx = Inf

    while abs(fx) >= tol && k < maxiter

        x = (a * fb - b * fa) / (fb - fa)
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

    return x, k
end


f(x) = x^3 - x - 2

a = 1
b = 2
tol = 10^-2
maxiter = 100

raiz, iteracoes = falsa_posicao(f, a, b, tol, maxiter)

println("Raiz aproximada: ", raiz)
println("Iterações: ", iteracoes)
println("Valor de f(raiz): ", f(raiz))