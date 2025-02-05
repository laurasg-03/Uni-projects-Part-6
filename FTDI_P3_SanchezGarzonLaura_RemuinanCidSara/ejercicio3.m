close all
clear all
clc

% FALTA NORMALIZAR 

% Ejercicio 1.3: representación de imágenes base
N=8; 
% Obtenemos los núcleos de transformación de la DCT y DST
[u,n]=meshgrid([0:N-1],[0:N-1]);
Wc=(sqrt(2/N))*cos((2*n+1)*pi.*u/(2*N));
Wc(:,1)=(1/sqrt(N));

Ws=(sqrt(2/(N+1)))*sin((n+1).*(u+1)*pi/(N+1)); 


% Creamos nuestra matriz NXN para las imágenes
m = zeros(N,N); 

% Rellenamos las matrices con los productos tensoriales de las columnas de
% cada núcleo. 
figure(Name= "DCT")
for n= 1:N
    for u=1:N
        m = Wc(:,n)*(Wc(:,u))'; 
        if n == 1 || u == 1
            m = m*N/2;
        else 
            m = m*N/sqrt(2);
        end
        subplot(N, N, N*(n-1) + u)
        imshow(m, [min(min(m)), max(max(m))]);
    end
end

figure(Name= "DST")
for n= 1:N
    for u=1:N
        m = Ws(:,n)*(Ws(:,u))'; 
        m = m*N/sqrt(2); 
        subplot(N, N, N*(n-1) + u)
        imshow(m, [min(min(m)), max(max(m))]);
    end
end
