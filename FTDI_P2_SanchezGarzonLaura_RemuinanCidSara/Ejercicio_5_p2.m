clc
close all
clear all

%% Grados de libertad en el filtrado 2D
x = [0:1/400:1-1/400];
y = [0:1/400:1-1/400];
[X,Y] = meshgrid(x,y);
f=sin(2*pi*90*X) + sin(2*pi*60*X + 2*pi*60*Y) + sin(2*pi*90*X - 2*pi*90*Y); 
fc=100/400;
f0_x=0.5 + 1/400; f0_y=0.5 + 1/400; 

%FT
F = fftshift(fft2(f)); 
modF1 = log(1 + abs(F)); 
figure; imshow(modF1, [min(min(modF1)) max(max(modF1))], 'InitialMagnification', 100); 


% filtro  cuadrado: 
fpb_cuad=1*double((X>(f0_x-fc) & X<(f0_x+fc)) & (Y>(f0_y-fc) & Y<(f0_y+fc)));
figure; imshow(fpb_cuad, [min(min(fpb_cuad)) max(max(fpb_cuad))], 'InitialMagnification', 100); 
Fcuad = F.*fpb_cuad; 
ima_range=max(max(f))-min(min(f)); 
quant=ima_range/256;
filtered_cuad=quant*round(real(ifft2(ifftshift(Fcuad)))/quant);
figure; imshow(filtered_cuad, [min(min(filtered_cuad)) max(max(filtered_cuad))], 'InitialMagnification', 100);


% filtro  romboide: 
fpb_romb=1*double((abs(X-f0_x)+abs(Y-f0_y))<fc);
figure; imshow(fpb_romb, [min(min(fpb_romb)) max(max(fpb_romb))], 'InitialMagnification', 100); 
Fromb = F.*fpb_romb; 
ima_range=max(max(f))-min(min(f)); 
quant=ima_range/256;
filtered_romb=quant*round(real(ifft2(ifftshift(Fromb)))/quant);
figure; imshow(filtered_romb, [min(min(filtered_romb)) max(max(filtered_romb))], 'InitialMagnification', 100);


% filtro  circular: 
fpb_circ=1*double((((X-f0_x).*(X-f0_x)+(Y-f0_y).*(Y-f0_y)).^(1/2))<fc); 
figure; imshow(fpb_circ, [min(min(fpb_circ)) max(max(fpb_circ))], 'InitialMagnification', 100); 
Fcirc = F.*fpb_circ; 
ima_range=max(max(f))-min(min(f)); 
quant=ima_range/256;
filtered_circ=quant*round(real(ifft2(ifftshift(Fcirc)))/quant);
figure; imshow(filtered_circ, [min(min(filtered_circ)) max(max(filtered_circ))], 'InitialMagnification', 100);

