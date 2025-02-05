function DCT_i = transformada_inversa_DCT(f)
[image_width,image_heigth]=size(f);
N=image_width;M=image_heigth;
[u,n]=meshgrid([0:N-1],[0:N-1]);
W_cos=(sqrt(2/N))*cos((2*n+1)*pi.*u/(2*N));
W_cos(:,1)=(1/sqrt(N)); 
F_cos=conj(W_cos')*f*conj(W_cos);
DCT_i=W_cos*F_cos*W_cos'; %no se aplica logaritmo porque es una imagen, no una representacon en frecuencia
end