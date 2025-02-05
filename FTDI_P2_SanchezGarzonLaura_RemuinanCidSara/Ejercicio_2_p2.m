clc
close all
clear all
%% Ejercicio 2: Transformada de Fourier; caso general. 
n=[0:1/200:1.02-1/200]; m=[0:1/200:1.03-1/200];
[N,M]=meshgrid(n,m);
f1= sin(40*pi*N + 30*pi*M);
f2= sin(120*N + 90*M);
[maximo1, minimo1]=MaxMin(f1);
[maximo2, minimo2]=MaxMin(f2);

figure; imshow(f1,[minimo1 maximo1], "InitialMagnification", 100);
figure; imshow(f2,[minimo2 maximo2], "InitialMagnification", 100);

F1=fftshift(fft2(f1)); 
F1_norm=abs(F1)/max(max(abs(F1)));
[image_h1,image_w1]=size(f1);
fx1=[-image_w1/2:image_w1/2]; fx1=fx1(1:end-1); %de -100 a 99 (cuenta el 0)
fy1=[-image_h1/2:image_h1/2]; fy1=fy1(1:end-1); 

F2=fftshift(fft2(f2)); 
[image_h2,image_w2]=size(f2);
fx2=[-image_w2/2:image_w2/2]; fx2=fx2(1:end-1); %de -100 a 99 (cuenta el 0)
fy2=[-image_h2/2:image_h2/2]; fy2=fy2(1:end-1); 
F2_norm=abs(F2)/max(max(abs(F2)));

figure; mesh(fx1, fy1, F1_norm); 
figure; mesh(fx2, fy2, F2_norm); 

F1log=log(1+abs(F1)); 
F2log=log(1+abs(F2));
figure;imshow(F1log,[min(min(F1log)) max(max(F1log))],'InitialMagnification',100);
figure;imshow(F2log,[min(min(F2log)) max(max(F2log))],'InitialMagnification',100);

%%
n1=[0:1/200:1-1/200]; m1=[0:1/200:1.03-1/200];
[N1,M1]=meshgrid(n1,m1);
f11= sin(40*pi*N1 + 30*pi*M1);
f21= sin(120*N1 + 90*M1);
[maximo11, minimo11]=MaxMin(f11);
[maximo21, minimo21]=MaxMin(f21);

figure; imshow(f11,[minimo11 maximo11], "InitialMagnification", 100);
figure; imshow(f21,[minimo2 maximo21], "InitialMagnification", 100);

F11=fftshift(fft2(f11)); 
F11_norm=abs(F11)/max(max(abs(F11)));
[image_h11,image_w11]=size(f11);
fx11=[-image_w11/2:image_w11/2]; fx11=fx11(1:end-1); %de -100 a 99 (cuenta el 0)
fy11=[-image_h11/2:image_h11/2]; fy11=fy11(1:end-1); 

F21=fftshift(fft2(f21)); 
[image_h21,image_w21]=size(f21);
fx21=[-image_w21/2:image_w21/2]; fx21=fx21(1:end-1); %de -100 a 99 (cuenta el 0)
fy21=[-image_h21/2:image_h21/2]; fy21=fy21(1:end-1); 
F21_norm=abs(F21)/max(max(abs(F21)));

figure; mesh(fx11, fy11, F11_norm); 
figure; mesh(fx21, fy21, F21_norm); 

F11log=log(1+abs(F11)); %log en base 2 comprime el rango
F21log=log(1+abs(F21));
figure;imshow(F11log,[min(min(F11log)) max(max(F11log))],'InitialMagnification',100);
figure;imshow(F21log,[min(min(F21log)) max(max(F21log))],'InitialMagnification',100);


%%
n2=[0:1/200:1.02-1/200]; m2=[0:1/200:1-1/200];
[N2,M2]=meshgrid(n2,m2);
f12= sin(40*pi*N2 + 30*pi*M2);
f22= sin(120*N2 + 90*M2);
[maximo12, minimo12]=MaxMin(f12);
[maximo22, minimo22]=MaxMin(f22);

figure; imshow(f12,[minimo12 maximo12], "InitialMagnification", 100);
figure; imshow(f22,[minimo22 maximo22], "InitialMagnification", 100);

F12=fftshift(fft2(f12)); 
F12_norm=abs(F12)/max(max(abs(F12)));
[image_h12,image_w12]=size(f12);
fx12=[-image_w12/2:image_w12/2]; fx12=fx12(1:end-1); %de -100 a 99 (cuenta el 0)
fy12=[-image_h12/2:image_h12/2]; fy12=fy12(1:end-1); 

F22=fftshift(fft2(f22)); 
[image_h22,image_w22]=size(f22);
fx22=[-image_w22/2:image_w22/2]; fx22=fx22(1:end-1); %de -100 a 99 (cuenta el 0)
fy22=[-image_h22/2:image_h22/2]; fy22=fy22(1:end-1); 
F22_norm=abs(F22)/max(max(abs(F22)));

figure; mesh(fx12, fy12, F12_norm); 
figure; mesh(fx22, fy22, F22_norm); 

F12log=log(1+abs(F12)); %log en base 2 comprime el rango
F22log=log(1+abs(F22));
figure;imshow(F12log,[min(min(F12log)) max(max(F12log))],'InitialMagnification',100);
figure;imshow(F22log,[min(min(F22log)) max(max(F22log))],'InitialMagnification',100);

