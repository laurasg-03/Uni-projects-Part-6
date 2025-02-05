clc
clear all
close all
%% Ejercicio 1
n=[0:1/200:1-1/200]; m=[0:1/200:1-1/200];
[N,M]=meshgrid(n,m);
f1= sin(10*pi*N);
f2= sin(20*pi*M);
f3= sin(40*pi*N + 30*pi*M);
f4= sin(10*pi*N + 20*pi*M) + sin(30*pi*N + 30*pi*M);


% Obtengo los extremos
[maximo1, minimo1]=MaxMin(f1);
[maximo2, minimo2]=MaxMin(f2);
[maximo3, minimo3]=MaxMin(f3);
[maximo4, minimo4]=MaxMin(f4);


figure()
subplot(2,2,1);imshow(f1,[minimo1 maximo1], "InitialMagnification", 100);
subplot(2,2,2);imshow(f2,[minimo2 maximo2], "InitialMagnification", 100);
subplot(2,2,3);imshow(f3,[minimo3 maximo3], "InitialMagnification", 100);
subplot(2,2,4);imshow(f4,[minimo4 maximo4], "InitialMagnification", 100);

%% REPRESENTACIÓN DEL MÓDULO DE LA FT EN 3D: 
%obtener la FT 
F1=fftshift(fft2(f1)); 
F2=fftshift(fft2(f2)); 
F3=fftshift(fft2(f3)); 
F4=fftshift(fft2(f4)); 

[image_h,image_w]=size(f1);
fx1=[-image_w/2:image_w/2]; fx1=fx1(1:end-1); %de -100 a 99 (cuenta el 0)
fy1=[-image_h/2:image_h/2]; fy1=fy1(1:end-1); 

F1=abs(F1)/max(max(abs(F1)));
F2=abs(F2)/max(max(abs(F2)));
F3=abs(F3)/max(max(abs(F3)));
F4=abs(F4)/max(max(abs(F4)));

figure()
subplot(2,2,1); mesh(fx1, fy1, F1); 
subplot(2,2,2); mesh(fx1, fy1, F2); 
subplot(2,2,3); mesh(fx1, fy1, F3); 
subplot(2,2,4); mesh(fx1, fy1, F4); 

%% REPRESENTACIÓN DEL MÓDULO DE LA FT COMO UNA IMAGEN: 
F1log=log(1+abs(F1)); %Dado que la imagen sólo contiene 256 niveles o valores distintos 
% de la señal que representa, en vez de representar el módulo normalizado de la FT 
% resulta más conveniente representar su logaritmo
F2log=log(1+abs(F2));
F3log=log(1+abs(F3));
F4log=log(1+abs(F4));

figure;imshow(F1log,[min(min(F1log)) max(max(F1log))],'InitialMagnification',100);
figure;imshow(F2log,[min(min(F2log)) max(max(F2log))],'InitialMagnification',100);
figure;imshow(F3log,[min(min(F3log)) max(max(F3log))],'InitialMagnification',100);
figure;imshow(F4log,[min(min(F4log)) max(max(F4log))],'InitialMagnification',100);

