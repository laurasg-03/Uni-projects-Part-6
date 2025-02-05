clc
clear all
close all

% Para realizar este ejercicio, en primer lugar, lea y represente la imagen Xray.jpg. 
% Obtenga, utilizando la función size, sus dimensiones (anchura y altura de la imagen, 
% medidas en elementos o píxeles).
% Conviértala en una imagen de tipo double, para poder operar con ella.
%%
[ima1,map1]=imread("Xray_th.tif"); % true color, binaria logical

figure(1)
% Guardar la imagen en formato JPEG
nombre_archivo = 'Xray.jpg.jpg';
imwrite(ima1, nombre_archivo);

% Verificar si se ha guardado correctamente
if exist(nombre_archivo, 'file')
    disp(['La imagen se ha guardado en ', nombre_archivo]);
else
    disp(['Hubo un problema al guardar la imagen en ', nombre_archivo]);
end

% Mostrar la imagen guardada
imagen_guardada = imread(nombre_archivo);
imshow(imagen_guardada);

%%
% [ima,map]=imread("Xray.jpg"); % true color, binaria logical
% [ancho,alto]=size(ima);
% imagen_double = im2double(ima);
% 
% 
% n=[0:1/ancho:1-1/ancho]; m=[0:1/alto:1-1/alto];
% [N,M]=meshgrid(n,m);
% f=0.5+0.5.*cos(2*pi*N + 4*pi*M);
% f1 = f'; 
% 
% ima_rgb=zeros(ancho, alto, 3);
% ima_rgb (:,:,1)= f1;
% ima_rgb (:,:,2)= f1;
% ima_rgb (:,:,3)= f1;
% 
% imagen_final = (imagen_double + ima_rgb)/2;
% imshow(imagen_final)


% imagen original
[ima, map]=imread("Xray.jpg"); 
% ima 3D uint8, map vacío -> true-color, colores
size(ima);
[imad]=im2double(ima); %uint8 a double

% imagen función
ima_w=367; ima_h=472;
x=0:1/ima_h:1-1/ima_h; y=0:1/ima_w:1-1/ima_w;
[X,Y]=meshgrid(x,y);
f=0.5+0.5*cos(2*pi*X+4*pi*Y); %ahora solo falta añadir una componente más

figure(1)
subplot(1,2,1), imshow(f)
subplot(1,2,2), imshow(imad)

f_rgb=zeros(ima_w, ima_h, 3);
f_rgb (:,:,1)= f;
f_rgb (:,:,2)= f;
f_rgb (:,:,3)= f;


% sumamos las imágenes
ima_final=(imad+f_rgb)/2; % se divide /2 para mantener el rango [0,1]
figure(2)
subplot(1,3,1), imshow(f_rgb)
subplot(1,3,2), imshow(imad)
subplot(1,3,3), imshow(ima_final)

%% Procesamiento a nivel de bloque
% [ima_procesada]= blkproc(ima,[m n],fun), %m y n son las dimensiones del bloque
%                                 %y fun es un enlace a una función que
%                                 %acepta como entrada una matriz X (de
%                                 %dimensiones m y n) y devuelve una matriz
%                                 %Y, donde Y = fun(X).
% func = @(x) mean(mean(x));

[ima, map]=imread("Skin_gray.jpg"); 
m=8; n=8;
func = @(x) mean(mean(x)); %para todo el x de entrada, hacer las medias
[ima_procesada]= blkproc(ima,[m n],func); 
figure(3);imshow(ima_procesada, [min(ima_procesada(:)), max(ima_procesada(:))]) %se pierde info
