function porcentajes_energia = distribucion_energia(f, K)
[M,N]=size(f);
alto_subimagen=M/K;
ancho_subimagen=N/K;

porcentajes_energia = zeros(K,K);
energia = calcular_energia(f); 

for u = 0:(K-1)
    for n = 0:(K-1)
        matriz = f(u*(ancho_subimagen)+1 : (u*(ancho_subimagen) + ancho_subimagen), n*(alto_subimagen)+1 : (n*(alto_subimagen) + alto_subimagen));
        porcentajes_energia(u+1,n+1) = 100*calcular_energia(matriz)/energia; 
    end
end