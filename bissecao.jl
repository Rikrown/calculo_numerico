#NOME DA DUPLA: Victor de Oliveira Silva e Gabriel Perrout Gomes de Moura 

function bissecao(f, a, b, tol, maxiter)
    k = 0
    fa = f(a)
    fb = f(b)
    
    while (b-a)/2 > tol && k < maxiter  
        x = (a + b) / 2
        fx = f(x)
        if fa * fx < 0
            b = x
            fb = fx
        elseif fb * fx < 0
            a = x
            fa = fx
        end
        k += 1
    end
    
    raiz = (a + b) / 2
    return raiz, k
end

raiz, iteracoes = bissecao(x -> x^3 - x - 2, 1, 2, 0.0001, 100)
println("Raiz: ", raiz, " Iterações: ", iteracoes)