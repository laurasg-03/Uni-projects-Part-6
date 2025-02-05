clc
clear all
close all
%% Representación de vectores base
N=8;

%funciones base 1d
[u,n]=meshgrid([0:N-1],[0:N-1]);
Wc=(sqrt(2/N))*cos((2*n+1)*pi.*u/(2*N));
Wc(:,1)=(1/sqrt(N));

% 
% Wdct1_base
%visualizar 1d
for (k=1:N)
    subplot(8,1,k);
    plot(Wc(:,k)); hold on
    stem(Wc(:,k)); hold off
end


%% seno
Ws=(sqrt(2/N+1))*sin(((n+1).*(u+1)*pi)/(N+1));

for (k=1:N)
    subplot(8,1,k);
    plot(Ws(:,k)); hold on
    stem(Ws(:,k)); hold off
end