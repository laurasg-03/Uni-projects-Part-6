clc
clear all
close all
%% Cálculo de una transformada directa y de su inversa 
[ima, map]=imread("Skin.tif");
imagen=ind2gray(ima,map);
f=im2double(imagen);

% DCT directa
[F_cos,log_DCT] = transformada_directa_DCT(f); 

% DCT inversa
DCT_i = transformada_inversa_DCT(f); 

% Cálculo de energías
energia_f=calcular_energia(f);
energia_cos=calcular_energia(F_cos);
diferencia=energia_f-energia_cos;
energia_f
energia_cos
diferencia

figure('Name', 'DCT');
subplot(1,3,1);imshow(f, [min(min(f)) max(max(f))]);title("imagen original")
subplot(1,3,2);imshow(log_DCT, [min(min(log_DCT)) max(max(log_DCT))]);title("DCT")
subplot(1,3,3);imshow(DCT_i, [min(min(DCT_i)) max(max(DCT_i))]);title("Imagen inversa")

%%
% DST directa
[F_sen,log_DST] = transformada_directa_DST(f); 

% DST inversa
DST_i = transformada_inversa_DST(f); 

% % Cálculo de energías
energia_sen=calcular_energia(F_sen);
diferencia2=energia_f-energia_sen;
energia_f
energia_sen
diferencia2

figure('Name', 'DST');
subplot(1,3,1);imshow(f, [min(min(f)) max(max(f))]);title("imagen original")
subplot(1,3,2);imshow(log_DST, [min(min(log_DST)) max(max(log_DST))]);title("DST")
subplot(1,3,3);imshow(DST_i, [min(min(DST_i)) max(max(DST_i))]);title("Imagen inversa")