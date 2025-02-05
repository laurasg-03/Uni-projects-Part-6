clc
clear all
close all

%% Ejercicio 3: Transformada de Fourier de imágenes naturales. 
[ima,map]=imread("RNM-TOBILLO.jpg");
imshow("RNM-TOBILLO.jpg");
imagen=double(ima);

F1=fftshift(fft2(imagen)); 
F1_norm=abs(F1)/max(max(abs(F1)));
[image_h1,image_w1]=size(imagen);
fx1=[-image_w1/2:image_w1/2]; fx1=fx1(1:end-1); %de -100 a 99 (cuenta el 0)
fy1=[-image_h1/2:image_h1/2]; fy1=fy1(1:end-1); 
figure; mesh(fx1, fy1, F1_norm); 
F1log=log(1+abs(F1)); 
figure;imshow(F1log,[min(min(F1log)) max(max(F1log))],'InitialMagnification',100);

%%
a = [ima fliplr(ima); flipud(ima) flipud(fliplr(ima))];
F2=fftshift(fft2(a)); 
F2_norm=abs(F2)/max(max(abs(F2)));
[image_h2,image_w2]=size(a);
fx2=[-image_w2/2:image_w2/2]; fx2=fx2(1:end-1); %de -100 a 99 (cuenta el 0)
fy2=[-image_h2/2:image_h2/2]; fy2=fy2(1:end-1); 
figure; mesh(fx2, fy2, F2_norm); 
F2log=log(1+abs(F2)); 
imshow(a);
figure;imshow(F2log,[min(min(F2log)) max(max(F2log))],'InitialMagnification',100);

%% 
[imah,maph]=imread("Hernia_disco.jpg");
imshow("Hernia_disco.jpg");
imagenh=double(imah);

F1h=fftshift(fft2(imagenh)); 
F1_normh=abs(F1h)/max(max(abs(F1h)));
[image_h1h,image_w1h]=size(imagenh);
fx1h=[-image_w1h/2:image_w1h/2]; fx1h=fx1h(1:end-1); %de -100 a 99 (cuenta el 0)
fy1h=[-image_h1h/2:image_h1h/2]; fy1h=fy1h(1:end-1); 
figure; mesh(fx1h, fy1h, F1_normh); 
F1logh=log(1+abs(F1h)); 
figure;imshow(F1logh,[min(min(F1logh)) max(max(F1logh))],'InitialMagnification',100);

%%
ah = [imah fliplr(imah); flipud(imah) flipud(fliplr(imah))];
F2h=fftshift(fft2(ah)); 
F2_normh=abs(F2h)/max(max(abs(F2h)));
[image_h2h,image_w2h]=size(ah);
fx2h=[-image_w2h/2:image_w2h/2]; fx2h=fx2h(1:end-1); %de -100 a 99 (cuenta el 0)
fy2h=[-image_h2h/2:image_h2h/2]; fy2h=fy2h(1:end-1); 
figure; mesh(fx2h, fy2h, F2_normh); 
F2logh=log(1+abs(F2h)); 
imshow(ah);
figure;imshow(F2logh,[min(min(F2logh)) max(max(F2logh))],'InitialMagnification',100);