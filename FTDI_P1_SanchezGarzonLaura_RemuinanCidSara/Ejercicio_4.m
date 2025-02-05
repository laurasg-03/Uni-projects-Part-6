clc
close all
clear all

% imshow permite presentar imágenes de tipo double, con valores tanto positivos como negativos. 
% Sin embargo, los formatos de almacenamiento de imágenes más extendidos exigen que éstas se 
% encuentren indexadas (de tipo uint8 o uint16) o que sean true-color con componentes de tipo uint8. 
% De ahí que para almacenar o intercambiar imágenes sea recomendable que tengan este tipo antes de grabarlas,
% junto con su mapa de colores si son indexadas. 

% El objetivo de este ejercicio es grabar alguna de las imágenes obtenidas en los ejercicios 1 o 2.
% 
% - Cuando la imagen sea de tipo double, utilice primero la función im2uint8() para convertirla a una
% imagen true-color con componentes de tipo uint8 (este paso no es estrictamente necesario, ya que la
% función imwrite lo realiza automáticamente para imágenes de tipo double). Recuerde que esta función
% (y, por lo tanto, la función imwrite) sólo arroja el resultado esperado si la imagen de tipo double toma
% valores en el rango [0,1] ; si no, debe realizar la conversión usted mismo, siguiendo el procedimiento
% expuesto en el Ejercicio 2. 
% 
% Una vez creada la imagen de tipo uint8, utilice la función imwrite() para almacenarla en un fichero.
% Luego intente visualizar la imagen grabada con un programa cualquiera (que no sea MatLab). Si no lo
% consigue, es porque el ajuste de rango de la imagen obtenida no es correcto.
% 
% Por último, utilice la función imfinfo(ima) si quiere verificar las propiedades de la imagen guardada. 

[ima1,map1]=imread("MRI_pseudo_colored.jpg"); % true color, 3D uint8 --> color
[ima2,map2]=imread("CT_abdomen.jpg"); % true color, 2D uint8 --> blanco y negro
[ima3,map3]=imread("Skin.tif"); % indexada, color
[ima4,map4]=imread("Xray_th.tif"); % true color, binaria logical

figure(1)
% Guardar la imagen en formato JPEG
nombre_archivo = 'cerebro.jpg';
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

figure(2)
% Guardar la imagen en formato JPEG
nombre_archivo2 = 'abdomen.jpg';
imwrite(ima2, nombre_archivo2);

% Verificar si se ha guardado correctamente
if exist(nombre_archivo2, 'file')
    disp(['La imagen se ha guardado en ', nombre_archivo2]);
else
    disp(['Hubo un problema al guardar la imagen en ', nombre_archivo2]);
end

% Mostrar la imagen guardada
imagen_guardada2 = imread(nombre_archivo2);
imshow(imagen_guardada2);

figure(3)
% Guardar la imagen en formato JPEG
nombre_archivo3 = 'piel.jpg';
imwrite(ima3, nombre_archivo3);

% Verificar si se ha guardado correctamente
if exist(nombre_archivo3, 'file')
    disp(['La imagen se ha guardado en ', nombre_archivo3]);
else
    disp(['Hubo un problema al guardar la imagen en ', nombre_archivo3]);
end

% Mostrar la imagen guardada
imagen_guardada3 = imread(nombre_archivo3);
imshow(imagen_guardada3);

figure(4)
n=[0:1/256:1 - 1/256]; m=[0:1/256:1 - 1/256];
[N,M]=meshgrid(n,m);
f3=2/5*N+M/4;
aaaa=imshow(f3,[min(min(f3)) max(max(f3))]);
nombre_archivo4 = 'imagensenoscosenos.jpg';
imwrite(aaaa, nombre_archivo4);

imfinfo("piel.jpg")