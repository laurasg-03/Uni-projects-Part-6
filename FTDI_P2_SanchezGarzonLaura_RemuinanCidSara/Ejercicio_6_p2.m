clc
clear all
close all

%% Aportación perceptual del módulo y la fase de la FT
[ima, map]=imread("Xray_gray.jpg"); 
figure(1);imshow(ima, [min(ima(:)), max(ima(:))]);
imagen=double(ima);

F=fftshift(fft2(imagen)); 
F_norm=abs(F)/max(max(abs(F)));
[image_h,image_w]=size(imagen);
fx=[-image_w/2:image_w/2]; fx=fx(1:end-1); %de -100 a 99 (cuenta el 0)
fy=[-image_h/2:image_h/2]; fy=fy(1:end-1); 
figure(2); mesh(fx, fy, F_norm); 
Flog=log(1+abs(F)); 
figure(3);imshow(Flog,[min(min(Flog)) max(max(Flog))],'InitialMagnification',100);

%transformada inversa de la señal filtrada (para obtener la imagen resultante de un proceso de filtrado deberá aplicar la FT inversa)
ima_range=max(max(imagen))-min(min(imagen)); quant=ima_range/256;
F_abs=abs(F);
imagen_abs=quant*round(real(ifft2(ifftshift(F_abs)))/quant);

imagen_abs1=log(abs(imagen_abs)+1);
figure(4); imshow(imagen_abs1, [min(min(imagen_abs1)) max(max(imagen_abs1))], 'InitialMagnification', 100); 

F_abs1=mean(F_abs(:));
F_phase=angle(F);

FT=F_abs1*exp(1i*F_phase);

ima_range=max(max(imagen))-min(min(imagen)); quant=ima_range/256;
FT2_imagen=quant*round(real(ifft2(ifftshift(FT)))/quant);
imagen_abs2=log(abs(FT2_imagen)+1);
figure(5); imshow(imagen_abs2, [min(min(imagen_abs2)) max(max(imagen_abs2))], 'InitialMagnification', 100); 

