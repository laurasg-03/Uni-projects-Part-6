function [F_sen,DST_norm] = transformada_directa_DST(f)
[image_width,image_heigth]=size(f);
N=image_width;M=image_heigth;
[u,n]=meshgrid([0:N-1],[0:N-1]);
W_sen=(sqrt(2/N+1))*sin(((n+1).*(u+1)*pi)/(N+1));
F_sen=conj(W_sen')*f*conj(W_sen);
DST_norm=log(abs(F_sen)); %quitar el +1 pq sino el coseno se desplaza
end