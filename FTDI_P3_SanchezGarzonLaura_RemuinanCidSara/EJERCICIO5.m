clc
clear all
close all
%% Efecto de la eliminación de las componentes de menor energía. 
[ima, map] =imread("Skin.tif");
ima = ind2gray(ima, map); 
ima = im2double(ima);  
figure(Name='imagen inicial'); imshow(ima);

k = 16 ;
[ima_h, ima_w]= size(ima);

% DCT
N=ima_h; 
[u,n]=meshgrid([0:N-1],[0:N-1]);
Wc=(sqrt(2/N))*cos((2*n+1)*pi.*u/(2*N)); 
Wc(:,1)=(1/sqrt(N));
DCT = Wc'*ima*Wc;
mod = log(abs(DCT)); 
figure(Name = 'módulo transformada directa');imshow(mod, [min(min(mod)), max(max(mod))]);

% Distribución de energía de la DCT, dividida en 16x16
e = distribucion_energia(DCT, k); 
emin = min(min(e)); 
T = 2*emin;
e(e<=T) = 0;

for u = 0:(k-1)
    for n = 0:(k-1)
        if e(u+1,n+1) == 0 
            DCT(u*(ima_w/k) +1 : u*(ima_w/k) + ima_w/k, n*(ima_h/k) +1 : n*(ima_h/k) + ima_h/k)= 0;
        end
    end
end

mod = log(abs(DCT)); 
figure(Name = 'módulo transformada directa');
subplot(1,2,1);imshow(mod, [min(min(mod)), max(max(mod))]);
DCT_i=Wc*DCT*Wc';
subplot(1,2,2);imshow(DCT_i, [min(min(DCT_i)), max(max(DCT_i))]);

%%
T_16 = 16*emin;
e(e<=T_16) = 0;

for u = 0:(k-1)
    for n = 0:(k-1)
        if e(u+1,n+1) == 0 
            DCT(u*(ima_w/k) +1 : u*(ima_w/k) + ima_w/k, n*(ima_h/k) +1 : n*(ima_h/k) + ima_h/k)= 0;
        end
    end
end

mod = log(abs(DCT)); 
figure(Name = 'módulo transformada directa t_16');
subplot(1,2,1);imshow(mod, [min(min(mod)), max(max(mod))]);
DCT_i1=Wc*DCT*Wc';
subplot(1,2,2);imshow(DCT_i1, [min(min(DCT_i1)), max(max(DCT_i1))]);

T_256 = 256*emin;
e(e<=T_256) = 0;

for u = 0:(k-1)
    for n = 0:(k-1)
        if e(u+1,n+1) == 0 
            DCT(u*(ima_w/k) +1 : u*(ima_w/k) + ima_w/k, n*(ima_h/k) +1 : n*(ima_h/k) + ima_h/k)= 0;
        end
    end
end

mod = log(abs(DCT)); 
figure(Name = 'módulo transformada directa t_16');
subplot(1,2,1);imshow(mod, [min(min(mod)), max(max(mod))]);
DCT_i2=Wc*DCT*Wc';
subplot(1,2,2);imshow(DCT_i2, [min(min(DCT_i2)), max(max(DCT_i2))]);
