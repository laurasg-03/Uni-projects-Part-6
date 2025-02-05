clc
clear all
close all
%% Representación de imágenes base 
% En la transformada 2D --> el producto tensorial de todas las posibles parejas de vectores base da lugar a las imágenes base de la transformada 2D
N=8; 
[u,n]=meshgrid([0:N-1],[0:N-1]);
W_cos=(sqrt(2/N))*cos((2*n+1)*pi.*u/(2*N));
W_cos(:,1)=(1/sqrt(N));
W_cos_2D = zeros(N,N); 

W_sen=(sqrt(2/(N+1)))*sin((n+1).*(u+1)*pi/(N+1)); 

figure(Name= "DCT")
for n= 1:N
    for u=1:N
        W_cos_2D = W_cos(:,n)*(W_cos(:,u))'; 
        if n == 1 || u == 1
            W_cos_2D=W_cos_2D.*(N/sqrt(2));
        else
            W_cos_2D=W_cos_2D.*(N/2);
        end
        subplot(N, N, N*(n-1) + u)
        imshow(W_cos_2D);
    end
end
%%
figure(Name= "DST")
for n= 1:N
    for u=1:N
        W_sen_2D = W_sen(:,n)*(W_sen(:,u))'; 
        W_sen_2D = W_sen_2D*(N/sqrt(2)); 
        subplot(N, N, N*(n-1) + u)
        imshow(W_sen_2D);
    end
end
