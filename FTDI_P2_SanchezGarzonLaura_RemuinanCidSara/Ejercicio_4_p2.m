clc
clear all
close all



%% Filtrado paso bajo y paso alto ideal
clc
clear all
close all
%creo la imagen que quiero filtrar
x=[0:1/400:1-1/400]; y=[0:1/400:1-1/400];
[X,Y]=meshgrid(x,y);
f= sin(2*pi*160*X) + sin(2*40*pi*Y);
%[maximo, minimo]=MaxMin(f);
%figure; imshow(f,[minimo maximo], "InitialMagnification", 100);

%paso al dominio de frecuencias la imagen para poder aplicarle el filtro
F=fftshift(fft2(f)); %FT 
F_norm=abs(F)/max(max(abs(F)));
[image_w,image_h]=size(f);
fx=[-image_w/2:image_w/2]; fx=fx(1:end-1); %de -100 a 99 (cuenta el 0)
fy=[-image_h/2:image_h/2]; fy=fy(1:end-1); 
figure(1); mesh(fx, fy, F_norm); 
Flog=log(1+abs(F)); 
figure(2);imshow(Flog,[min(min(Flog)) max(max(Flog))],'InitialMagnification',100);

%creo el filtro
v1=1/400; v2=1/400; %vectores que se moverán en el retículo
fcorte_x = 30;
fcorte_y = 30;
fc_x=fcorte_x*v1; fc_y=fcorte_y*v2; %frecuencias de corte normalizadas en los ejes
f0_x=0.5+v1; f0_y=0.5+v2; %se centra (de mitad en x y mitad en y, la suma de vectores para "compensar el punto primero del retículo"
fpb=(X>(f0_x-fc_x) & X<(f0_x+fc_x)) & (Y>(f0_y-fc_y) & Y<(f0_y+fc_y)); %nos quedamos sólo con las frecuencias dentro del cuadrado 
fpa=~fpb; %el fpa será el inverso
fpb=1*double(fpb); fpa=1*double(fpa); %les hacemos doubles para poder operar con ellos

figure; imshow(fpb, [min(min(fpb)) max(max(fpb))], 'InitialMagnification', 100); 
figure; imshow(fpa, [min(min(fpa)) max(max(fpa))], 'InitialMagnification', 100); 

%se aplican los filtros
F_fpb = F.*fpb;
F_fpa = F.*fpa;

%transformada inversa de la señal filtrada (para obtener la imagen resultante de un proceso de filtrado deberá aplicar la FT inversa)
ima_range=max(max(f))-min(min(f)); quant=ima_range/256;
filtered_bajo=quant*round(real(ifft2(ifftshift(F_fpb)))/quant);
filtered_alto=quant*round(real(ifft2(ifftshift(F_fpa)))/quant);

figure; imshow(filtered_bajo, [min(min(filtered_bajo)) max(max(filtered_bajo))], 'InitialMagnification', 100); 
figure; imshow(filtered_alto, [min(min(filtered_alto)) max(max(filtered_alto))], 'InitialMagnification', 100); 

%%
fc_x2=30*v1;fc_y2=30*v1;
f0_x2=0.5+v1; f0_y2=0.5+v2; %se centra (de mitad en x y mitad en y, la suma de vectores para "compensar el punto primero del retículo"
fpb2=(X>(f0_x2-fc_x2) & X<(f0_x2+fc_x2)) & (Y>(f0_y2-fc_y2) & Y<(f0_y2+fc_y2)); %nos quedamos sólo con las frecuencias dentro del cuadrado 
fpa2=~fpb2; %el fpa será el inverso
fpb2=1*double(fpb2); fpa2=1*double(fpa2); %les hacemos doubles para poder operar con ellos

figure; imshow(fpb2, [min(min(fpb2)) max(max(fpb2))], 'InitialMagnification', 100); 
figure; imshow(fpa2, [min(min(fpa2)) max(max(fpa2))], 'InitialMagnification', 100); 

%se aplican los filtros
F_fpb2 = F.*fpb2;
F_fpa2 = F.*fpa2;

%transformada inversa de la señal filtrada (para obtener la imagen resultante de un proceso de filtrado deberá aplicar la FT inversa)
ima_range=max(max(f))-min(min(f)); quant=ima_range/256;
filtered_bajo2=quant*round(real(ifft2(ifftshift(F_fpb2)))/quant);
filtered_alto2=quant*round(real(ifft2(ifftshift(F_fpa2)))/quant);

figure; imshow(filtered_bajo2, [min(min(filtered_bajo2)) max(max(filtered_bajo2))], 'InitialMagnification', 100); 
figure; imshow(filtered_alto2, [min(min(filtered_alto2)) max(max(filtered_alto2))], 'InitialMagnification', 100);

%%
fc_x3=100*v1;fc_y3=100*v1;
f0_x3=0.5+v1; f0_y3=0.5+v2; %se centra (de mitad en x y mitad en y, la suma de vectores para "compensar el punto primero del retículo"
fpb3=(X>(f0_x3-fc_x3) & X<(f0_x3+fc_x3)) & (Y>(f0_y3-fc_y3) & Y<(f0_y3+fc_y3)); %nos quedamos sólo con las frecuencias dentro del cuadrado 
fpa3=~fpb3; %el fpa será el inverso
fpb3=1*double(fpb3); fpa3=1*double(fpa3); %les hacemos doubles para poder operar con ellos

figure; imshow(fpb3, [min(min(fpb3)) max(max(fpb3))], 'InitialMagnification', 100); 
figure; imshow(fpa3, [min(min(fpa3)) max(max(fpa3))], 'InitialMagnification', 100); 

%se aplican los filtros
F_fpb3 = F.*fpb3;
F_fpa3 = F.*fpa3;

%transformada inversa de la señal filtrada (para obtener la imagen resultante de un proceso de filtrado deberá aplicar la FT inversa)
ima_range=max(max(f))-min(min(f)); quant=ima_range/256;
filtered_bajo3=quant*round(real(ifft2(ifftshift(F_fpb3)))/quant);
filtered_alto3=quant*round(real(ifft2(ifftshift(F_fpa3)))/quant);

figure; imshow(filtered_bajo3, [min(min(filtered_bajo3)) max(max(filtered_bajo3))], 'InitialMagnification', 100); 
figure; imshow(filtered_alto3, [min(min(filtered_alto3)) max(max(filtered_alto3))], 'InitialMagnification', 100);
