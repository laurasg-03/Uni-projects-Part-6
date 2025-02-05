clc
clear all
close all
%% Representación de vectores base
% En la transformada 1D --> los vectores columna del núcleo que la define
% son precisamente los vectores de la nueva base que representa la transformada.

N=8;

%función base coseno 1d
W_cos=base_DCT_1D(N);
figure('Name', 'Representación W_cos');
for (k=1:N)
    subplot(8,1,k);
    plot(W_cos(:,k)); hold on
    stem(W_cos(:,k)); hold off
end

W_sen=base_DST_1D(N);
figure('Name', 'Representación W_sen');
for (j=1:N)
    subplot(8,1,j);
    plot(W_sen(:,j)); hold on
    stem(W_sen(:,j)); hold off
end
