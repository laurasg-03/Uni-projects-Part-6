clc
clear all
close all

% Para leer una imagen de un archivo utilice la función imread()

% o Si la imagen almacenada es una imagen indexada (VLT):
% - ima será una matriz o array de dos dimensiones de tipo uint8 o uint16
% - map será su tabla de colores, una matriz cuyas filas indican las tres componentes
% R, G, B del color que representan (si las tres componentes fueran iguales, representarían un nivel de gris)

% o Si la imagen grabada no es indexada, se trata de una imagen true-color, es decir, una imagen en la
% que el valor de cada píxel indica directamente su color:
% - no es un índice de una VLT por lo que en estas imágenes map está vacío
% - Una imagen true-color puede estar formada por dos o tres bandas o matrices de
% tipo uint8 (es decir, un array de dos o tres dimensiones):
%     -  Si se trata de un array de dos dimensiones (es decir, que a cada elemento de la imagen le 
% corresponde un valor), el valor de los píxeles es directamente un nivel de luminancia o nivel de gris 
% que va de 0 (negro) a 255 (blanco); por lo tanto, no incluye información de color.
%     -  Si se trata de un array de tres dimensiones, a cada elemento de la imagen le
% corresponden tres valores enteros que indican directamente las componentes roja, verde y azul de cada
% píxel, cada una de ellas variable entre 0 (componente inexistente) y 255 (máxima saturación en esa
% componente).
% - Dentro de la categoría true-color, las imágenes binarias son un tipo especial que solamente
% presenta dos valores; estas imágenes están formadas por una sola banda (es decir, un array de una
% dimensión) de tipo uint8 (con valores 0 o 255), o logical (con valores 0 o 1).
figure(1)
[ima1,map1]=imread("MRI_pseudo_colored.jpg"); % true color, 3D uint8 --> color
[ima2,map2]=imread("CT_abdomen.jpg"); % true color, 2D uint8 --> blanco y negro
[ima3,map3]=imread("Skin.tif"); % indexada, color
[ima4,map4]=imread("Xray_th.tif"); % true color, binaria logical


subplot(2,2,1);imshow(ima1,map1);
subplot(2,2,2);imshow(ima2,map2);
subplot(2,2,3);imshow(ima3,map3);
subplot(2,2,4);imshow(ima4,map4);

% A continuación, cambie la clase de imágenes que acaba de leer (respectivamente de VLT a 
% true-color o de true-color a VLT) y represéntelas en una misma figura. Para ello, utilice 
% las funciones gray2ind(), rgb2ind(), ind2rgb() e ind2gray().

% - gray2ind Convert intensity image to indexed image.
%     gray2ind scales, then rounds, an intensity image to produce an equivalent indexed image.
%  
%     [X,MAP] = gray2ind(I,N) converts the intensity image I to an indexed image X
%     with colormap GRAY(N). If N is omitted, it defaults to 64.
%  
%     [X,MAP] = gray2ind(BW,N) converts the binary image BW to an indexed image X
%     with colormap GRAY(N). If N is omitted, it defaults to 2.
%  
%     Example
%     -------
%         I = imread('cameraman.tif');
%         [X, map] = gray2ind(I, 16);
%         figure, imshow(X, map);



% - rgb2ind Convert RGB image to indexed image.
%     [X,MAP] = rgb2ind(RGB,N) converts the RGB image to an indexed image X.
%     MAP contains at most N colors. 
%    
%     Example
%     -------
%         RGB = imread('ngc6543a.jpg');
%         [X,map] = rgb2ind(RGB,128);
%         figure, image(X), colormap(map)
%         axis off
%         axis image



% - ind2rgb Convert indexed image to RGB image.
%     RGB = ind2rgb(X,MAP) converts the matrix X and corresponding
%     colormap MAP to RGB (truecolor) format.

%  ind2gray Convert indexed image to intensity image.
%     I = ind2gray(X,MAP) converts the image X with colormap MAP
%     to an intensity image I. % 
%  
%     Example
%     -------
%         load trees
%         I = ind2gray(X,map);
%         figure, imshow(X,map), figure, imshow(I);
% 



figure (2)
subplot(2,2,1);
I1 = imread("MRI_pseudo_colored.jpg");
[X1, MAP1] = rgb2ind(I1, 128);
image(X1), colormap(MAP1)
axis off
axis image

subplot(2,2,2);
I2 = imread("CT_abdomen.jpg");
[X2, MAP2] = gray2ind(I2, 16);
imshow(X2, MAP2);

subplot(2,2,3);
[X3,cmap] = imread('Skin.tif');
RGB = ind2rgb(X3,cmap);
imshow(RGB);

subplot(2,2,4);
I4 = imread("Xray_th.tif");
[X4, MAP4] = gray2ind(I4, 16);
imshow(X4, MAP4);

figure (3)
subplot(2,2,1);
imagen_gris1 = rgb2gray(I1);
imshow(imagen_gris1);

subplot(2,2,2);
imshow(X2, MAP2);

subplot(2,2,3);
imagen_gris2 = rgb2gray(RGB);
imshow(imagen_gris2);

subplot(2,2,4);
imshow(X4, MAP4);



