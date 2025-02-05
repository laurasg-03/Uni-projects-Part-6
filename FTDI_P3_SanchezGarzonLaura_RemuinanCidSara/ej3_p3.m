%% ej 3 práctica 3 ftdi
clear all
close all
clc

% definir el núcleo de la DCT 8x8
N1=7;
W_dct=ftdi.nucleo_dct(N1);

% representar imágenes base, producto de kronecker
figure(1)
ftdi.imagenes_base_dct(W_dct,N1)

% % definir el núcleo de la DCT 8x8
N=4;
W_dst=ftdi.nucleo_dst(N);

% representar imágenes base, producto de kronecker
figure(2)
ftdi.imagenes_base_dst(W_dst,N)


