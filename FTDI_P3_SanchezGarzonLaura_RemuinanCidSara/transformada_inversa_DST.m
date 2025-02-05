function DST_i = transformada_inversa_DST(f)
[image_width,image_heigth]=size(f);
N=image_width;M=image_heigth;
[u,n]=meshgrid([0:N-1],[0:N-1]);
W_sen=(sqrt(2/N+1))*sin(((n+1).*(u+1)*pi)/(N+1));
F_sen=conj(W_sen')*f*conj(W_sen);
DST_i=W_sen*F_sen*W_sen'; %no se aplica logaritmo porque es una imagen, no una representacon en frecuencia
end