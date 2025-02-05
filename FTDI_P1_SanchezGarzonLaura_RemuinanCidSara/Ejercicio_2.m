%Ejercicio 2
clc
clear all
close all
%%
n=[0:1/256:1]; m=[0:1/256:1];
[N,M]=meshgrid(n,m);
f= 32.*cos(2*pi*N)+16.*sin(4*pi*M);
minimo=min(min(f));
maximo=max(max(f));

figure (1)
subplot(2,3,1);imshow(f,[minimo maximo]);
subplot(2,3,2);imshow(f,[minimo/2 maximo/2]);
subplot(2,3,3);imshow(f,[minimo/4 maximo/4]);
subplot(2,3,4);imshow(f,[minimo/8 maximo/8]);
subplot(2,3,5);imshow(f,[minimo/16 maximo/16]);
subplot(2,3,6);imshow(f);

%%
% MatLab incluye la función im2uint8 para convertir una imagen de tipo double en una de tipo uint8,
% y la im2uint16
% para convertir una imagen f de tipo double a una imagen ima de tipo uint8, basta con desplazar,
% escalar y redondear los valores de tipo double de la imagen original (es decir, cuantificarlos en el rango
% del nuevo tipo):

min_f=min(min(f)); max_f=max(max(f)); % Obtengo los extremos
step_f=(max_f-min_f)/256; % Intervalo que corresponde a cada nivel
ima=uint8(round((f-min_f)/step_f)); % Desplazo y escalo 
figure (2); imshow(ima, gray(256)); % VLT de 256 niveles de gris 

f1= 32.*cos((2*pi*N)+3*pi*M)+16.*sin(4*pi*M);
min_f1=min(min(f1)); max_f1=max(max(f1)); % Obtengo los extremos
step_f1=(max_f1-min_f1)/256; % Intervalo que corresponde a cada nivel
ima1=uint8(round((f1-min_f1)/step_f1)); % Desplazo y escalo 
figure (3);

% Subplot 1
ax1=subplot(2,3,1);
colormap(ax1,winter);
imshow(ima1, winter(256));

ax2=subplot(2,3,2);
colormap(ax2,summer);
imshow(ima1, summer(256));

ax3=subplot(2,3,3);
colormap(ax3,spring);
imshow(ima1, spring(256));

ax4=subplot(2,3,4);
colormap(ax4,autumn);
imshow(ima1, autumn(256));

ax5=subplot(2,3,5);
colormap(ax5,bone);
imshow(ima1, bone(256));

ax6=subplot(2,3,6);
colormap(ax6,parula);
imshow(ima1, parula(256));




