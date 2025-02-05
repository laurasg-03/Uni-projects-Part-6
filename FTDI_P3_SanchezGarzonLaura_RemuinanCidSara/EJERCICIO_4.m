clc
close all
clear all
%% Observación de la distribución de energías de la imagen y su transformada. 
[ima, map]=imread("Skin.tif");
imagen=ind2gray(ima,map);
f=im2double(imagen);
K=4;
porcentajes_energia_f = distribucion_energia(f,K); 
porcentajes_energia_f

% DCT directa
[F_cos,log_DCT] = transformada_directa_DCT(f);
porcentajes_energia_DCT = distribucion_energia(F_cos,K); 
porcentajes_energia_DCT

% DST directa
[F_sen,log_DST] = transformada_directa_DST(f);
porcentajes_energia_DST = distribucion_energia(F_sen,K); 
porcentajes_energia_DST

%% verificar que da 100
suma_total = 0;
[num_filas, num_columnas] = size(porcentajes_energia_f);

for fila = 1:num_filas
    for columna = 1:num_columnas
        suma_total = suma_total + porcentajes_energia_f(fila, columna);
    end
end
suma_total