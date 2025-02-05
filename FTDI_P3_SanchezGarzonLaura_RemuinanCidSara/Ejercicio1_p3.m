clc
clear all
close all

%% Cálculo de una transformada directa y de su inversa

%DCT de una imagen
[ima, map]=imread("Skin.tif");
[M,N]=size(ima);
imagen1=ind2gray(ima,map);
imagen=im2double(imagen1);
%N=image_width;
[u,n]=meshgrid([0:N-1],[0:N-1]);
W=(sqrt(2/N))*cos((2*n+1)*pi.*u/(2*N));
W(:,1)=(1/sqrt(N));

%Directa
DCT=W'*imagen*W;
log_DCT=log(abs(DCT)); %quitar el +1 pq sino el coseno se desplaza
figure(1)
subplot(2,2,1);imshow(log_DCT, [min(min(log_DCT)) max(max(log_DCT))]);

%Inversa
DCT_i=W*DCT*W'; %no se aplica logaritmo porque es una imagen, no una representacon en frecuencia
subplot(2,2,2);imshow(DCT_i, [min(min(DCT_i)) max(max(DCT_i))]);

%Comprobación
e_ima_original=calcular_energia(imagen);
e_ima_DCT_i=calcular_energia(DCT_i);

%%
W1=(sqrt(2/N+1))*sin(((n+1).*(u+1)*pi)/(N+1));

%Directa
DCT1=W1'*imagen*W1;
log_DCT1=log(abs(DCT1)); %quitar el +1 pq sino el coseno se desplaza
subplot(2,2,3);imshow(log_DCT1, [min(min(log_DCT1)) max(max(log_DCT1))]);

%Inversa
DCT_i1=W1*DCT1*W1'; %no se aplica logaritmo porque es una imagen, no una representacon en frecuencia
subplot(2,2,4);imshow(DCT_i1, [min(min(DCT_i1)) max(max(DCT_i1))]);

%Comprobación
e_ima_original1=calcular_energia(imagen);
e_ima_DST_i1=calcular_energia(DCT_i1);
dif_e_1=e_ima_original1-e_ima_DST_i1;
