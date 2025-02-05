close all
clc
clear all

%%
% Para definir en MatLab una función escalar discreta, z = [n,m], en una región rectangular de un espacio
% bidimensional (2D), primero es necesario definir dos matrices con los valores que toma cada una de las
% dos variables (n,m) en cada punto de dicha región. Para ello: 
% - Se definen dos vectores, m y n, con los rangos de variación de las correspondientes variables que
% delimitan la región en que se va a definir la función escalar.
% - Se utiliza la expresión [N,M]=meshgrid(n,m), que genera en N y M las dos matrices indicadas.
% - Se escribe la expresión de la función deseada, utilizando N en el lugar de n y M en el lugar de m. 

% Función continua: z(x,y)=cos(2 pi x)+sen(6 pi y)
% Región: 0<=x<=4; 0<=y<=4;
% Vectores: v1=(0.5,0); v2=(0,0.5);

n0=[0:0.05:4]; m0=[0:0.05:4];
[N0,M0]=meshgrid(n0,m0);
f=cos(2*pi*N0)+sin(6*pi*M0);
% 
% Un modo de representar una función 2D es crear una imagen con tonos grises, en la que la posición de
% cada elemento o píxel representa una coordenada del espacio 2D, y el valor o nivel de gris de cada píxel
% representa el valor de la función en dicha coordenada. Una imagen es, desde este punto de vista, una
% matriz de valores. 

% Para representar una matriz de valores en forma de imagen se utiliza la función imshow, indicando la
% función a representar y los valores de la función a que corresponden el negro (habitualmente el mínimo de
% la función) y el blanco (habitualmente el máximo de la función). 

figure (1)
imshow(f,[-2 2],'InitialMagnification',100); % Muestra la función f como una imagen.
% Observe que la función f toma como mínimo el valor -2 (que se muestra negro en la imagen) y como
% máximo el valor 2 (que se muestra blanco). 

% El parámetro 'InitialMagnification' fijado al valor 100 fuerza a que la imagen se presente a
% tamaño real (cada píxel de la imagen corresponde con un punto del monitor), siempre que el tamaño del
% monitor lo permita. Este es el único modo de garantizar que la imagen se presenta con la máxima
% precisión. 

% Una redacción alternativa y genérica de este comando podría haber sido:
figure (2)
imshow(f,[min(min(f)) max(max(f))], 'InitialMagnification',100);

% Para representar varias imágenes en una misma ventana utilice el comando subplot en combinación
% con el comando imshow. Ejemplo: 
figure (3)
subplot(1,2,1), imshow(f,[-2 2]);
subplot(1,2,2), imshow(f,[-1 1]);

% Observe que en este caso no es posible controlar que la imagen se presente a tamaño real (por lo que
% el parámetro 'InitialMagnification' no es de utilidad). Explique por qué motivo las dos imágenes se
% ven distintas, para ello quizás le resulte de ayuda el incluir el comando colorbar tras la representación de
% cada imagen
figure (4)
subplot(1,2,1), imshow(f,[-2 2]); colorbar 
subplot(1,2,2), imshow(f,[-1 1]); colorbar

%%
% Región: 0<=x<1; 0<=y<1;
% Vectores: v1=(1/256,0);v2=(0,1/256);

%1. z1(x,y)=4/5x; z2(x,y)=y/2; z3(x,y)=2/5x+y/4
n=[0:1/256:1 - 1/256]; m=[0:1/256:1 - 1/256];
[N,M]=meshgrid(n,m);
f1=4/5*N;
f2=M/2;
f3=2/5*N+M/4;
figure (5)
subplot(1,3,1), imshow(f1,[min(min(f1)) max(max(f1))]);
subplot(1,3,2), imshow(f2,[min(min(f2)) max(max(f2))]);
subplot(1,3,3), imshow(f3,[min(min(f3)) max(max(f3))]);

%2. z1(x,y)=cos(2pix); z2(x,y)=cos(4pix); z3(x,y)=cos(8pix); z4(x,y)=cos(16pix)
f4=cos(2*pi*N);
f5=cos(4*pi*N);
f6=cos(8*pi*N);
f7=cos(16*pi*N);

figure (6)
subplot(1,4,1), imshow(f4,[min(min(f4)) max(max(f4))]);
subplot(1,4,2), imshow(f5,[min(min(f5)) max(max(f5))]);
subplot(1,4,3), imshow(f6,[min(min(f6)) max(max(f6))]);
subplot(1,4,4), imshow(f7,[min(min(f7)) max(max(f7))]);

%3. z1(x,y)=cos(2pix)+sen(8piy); z2(x,y)=cos(2pix)+sen(16piy)
f8=cos(2*pi*N)+sin(8*pi*M);
f9=cos(2*pi*N)+sin(16*pi*M);

figure (7)
subplot(1,2,1), imshow(f8,[min(min(f8)) max(max(f8))]);
subplot(1,2,2), imshow(f9,[min(min(f9)) max(max(f9))]);

%4. z1(x,y)=cos(4pix+4piy); z2(x,y)=cos(4pix+8piy)
f10=cos((4*pi*N)+(4*pi*M));
f11=cos((4*pi*N)+(8*pi*M));

figure (8)
subplot(1,2,1), imshow(f10,[min(min(f10)) max(max(f10))]);
subplot(1,2,2), imshow(f11,[min(min(f11)) max(max(f11))]);