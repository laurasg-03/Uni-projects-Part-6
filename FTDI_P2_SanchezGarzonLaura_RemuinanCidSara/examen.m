clc
clear all
close all
%% GENERACIÓN DE IMÁGENES A PARTIR DE EXPRESIONES ANALÍTICAS
%Ejemplo: f(x,y)=sin(6piy); 0<=x<4, 0<=y<4; v1=(0.5,0), v2=(0,0.5)
n=[0:0.5:4-0.5]; m=[0:0.5:4-0.5]; %vectores que representan x e y (rangos y variación)
[N,M]=meshgrid(n,m); %se crean la matrices N y M (N contiene todas las variaciones de n a lo largo de las filas, y M de las columnas.)
f=sin(6*pi*M); %se evalúa la función en cada punto de una cuadrícula: x->N, y->M 
imshow(f,[min(min(f)) max(max(f))], 'InitialMagnification',100);%coge la función y la representa (mapeando los colores en función de los valores máximo y mínimo de las columnas)
%se garantiza que se aprovecha todo el rango de L niveles representables (si no se pusiera el rango, se perdería resolución en la representación de los tonos de gris)
%podría haberse usado imshow(f,[-2 2]), que además permite controlar el rango en las escala de grises que se desea tener ([-1,1] tendrá menos tonalidades
%OJO SON IMÁGENES TIPO DOUBLE (sus píxeles pueden tomar cualquier valor real y puede operarse directamente con ellas)

%% PRESENTACIÓN DE IMÁGENES: VTL, DOUBLE...
%Imágenes indexadas: más eficiente: VTL --> los píxeles de la imagen no representen directamente niveles de intensidad, sino índices de un mapa de colores, que contiene el color a representar
%los valores han de ser enteros positivos y la imagen tipo uint8(1 byte por pixel -->[0, 255] de posibles colores) o uint16 ([0,65535])
%la desventaja es que con imágenes de tipos enteros, MatLab no permite
%aplicar directamente casi ninguna operación:
   %im2uint8 double --> uint8; im2uint16 double --> uint16
   %las funciones asumen que la imagen double se encuentra dentro del rango
   %0<f<1 --> hay que desplazar,escalar y redondear

min_f=min(min(f)); max_f=max(max(f)); % Obtengo los extremos
step_f=(max_f-min_f)/256; % Intervalo que corresponde a cada nivel
ima=uint8(round((f-min_f)/step_f)); % Desplazo y escalo 
figure; imshow(ima, gray(256)); % VLT de 256 niveles de gris

%utilizar mapa de colores de matlab:
ax1=subplot(2,3,1);
colormap(ax1,winter);
imshow(ima, winter(256));

ax2=subplot(2,3,2);
colormap(ax2,summer);
imshow(ima, summer(256));

%% LECTURA DE IMÁGENES A PARTIR DE UN ARCHIVO
[ima,map]=imread("imagen.jpg");
%si la imagen es indexada: 
        %ima es una matriz 2D tipo uint8 o uint16
        %map será su tabla de colores
%si la imagen es true color:
        %ima:
            %2D tipo uint8 --> no hay info de color (a cada píxel le corresponde un grado de gris)
            %3D tipo uint8 --> RGB (on valores de 0 a 255)
            %tipo binaria 
                %tipo uint8 (valores 0 o 255)
                %tipo logical (alores 0 o 1)
        %map vacío
%FUNCIONES:
%gray2ind()
I2 = imread("CT_abdomen.jpg");
[X2, MAP2] = gray2ind(I2, 16);
imshow(X2, MAP2);
%rgb2ind()
I1 = imread("imagen.jpg");
[X1, MAP1] = rgb2ind(I1, 128);
image(X1), colormap(MAP1)
axis off
axis image
%ind2rgb()
[X3,cmap] = imread('Skin.tif');
RGB = ind2rgb(X3,cmap);
imshow(RGB);
%ind2gray()

%rgb2gray() poner una imagen a color en blanco y negro
imagen_gris1 = rgb2gray(I1);
imshow(imagen_gris1);

%% GRABACIÓN DE IMÁGENES A UN ARCHIVO
%cuando la imagen sea de tipo double:
    %1º im2uint8(): double --> true-color tipo uint8 (o usar imwrite(), que lo realiza automáticamente)
    %2º asegurarse de que double toma valores en el rango [0,1] ; si no:
        % min_f=min(min(f)); max_f=max(max(f));
        % step_f=(max_f-min_f)/256; % Intervalo que corresponde a cada nivel
        % ima=uint8(round((f-min_f)/step_f)); % Desplazo y escalo 
    %3º imwrite() almacena la imagen en un fichero
    %4º imfinfo(ima) para verificar las propiedades de la imagen guardada.

[ima1,map1]=imread("MRI_pseudo_colored.jpg"); % true color, 3D uint8 --> color
nombre_archivo = 'cerebro.jpg'; % Guardar la imagen en formato JPG
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

%% OPERACIONES CON IMÁGENES
%Operar con una imagen: double y true-color-->para ponderarla, escalarla, etc., sin perder rango de representación en el resultado
%Operar con dos imágenes: double, true-color y ambas deben tener las mismas dimensiones (filas, columnas y número de bandas o valores por píxel). 
    %Pasar de indexado A true color double: ind2rgb(ima) --> viene definida en el rango [0,1]
    %Pasar de indexado o true color A double: im2double(ima) --> viene definida en el rango [0,1] y en el mismo formato 
    %Pasar de true color a color A escala de grises: rgb2gray(ima)-->se pierde la info del color
    %Pasar de escala de grises a color:
        %ima_rgb=zeros(ima_h, ima_w, 3);
        %ima_rgb (:,:,1)= ima_gray;
        %ima_rgb (:,:,2)= ima_gray;
        %ima_rgb (:,:,3)= ima_gray;
        
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

%% OBTENCIÓN DE LA FT   
%Forma 1:  representar su módulo normalizado en 3D
n=[0:1/200:1-1/200]; m=[0:1/200:1-1/200];
[N,M]=meshgrid(n,m);
f= sin(10*pi*N);
imshow(f,[min(min(f)) max(max(f))], "InitialMagnification", 100); %Hasta aquí se obtiene una imagen a aprtir de una función analítica
F=fftshift(fft2(f)); %se obtiene la FT (fft2 obtiene la FT 2D y fftshift sitúa la componente de frecuencia 0 en el centro de la imagen y las de altas frecuencias en las esquinas.)
[image_w,image_h]=size(f);%calculamos el tamaño de la imagen, de forma qie 
fx=[-image_w/2:image_w/2]; fx=fx(1:end-1); %el eje x irá desde la mitad de la imagen, hasta la otra mitad (de -100 a 99 (cuenta el 0))
fy=[-image_h/2:image_h/2]; fy=fy(1:end-1); 
F=abs(F)/max(max(abs(F)));%módulo normalizado
mesh(fx, fy, F); %representación del módulo de la FT en 3D

%Forma 2: representar su módulo normalizado en 2D, asumiendo que el módulo de la FT es una imagen discreta
Flog=log(1+abs(F)); %Dado que la imagen sólo contiene 256 niveles de la señal que representa, se aplica logaritmo, que maximiza las diferencias
figure;imshow(F1log,[min(min(F1log)) max(max(F1log))],'InitialMagnification',100); %representación del módulo de la FT como una imagen


%% Evitar discontinuidades creando una imagen cíclica
a = [ima fliplr(ima); flipud(ima) flipud(fliplr(ima))];