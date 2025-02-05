function [DCT,DCT_norm] = transformada_directa_DCT(ima)
% Devuelve la DCT de una imagen (𝜳=W*^T⋅𝝍⋅W*)y la DCT normalizada
% ima debe pasarse en double [0,1], ima [NxN]
[image_width,image_heigth]=size(ima);
N=image_width; M=image_heigth;
[u,n]=meshgrid([0:N-1],[0:N-1]);
W_cos=(sqrt(2/N))*cos((2*n+1)*pi.*u/(2*N));
W_cos(:,1)=(1/sqrt(N)); 
DCT=conj(W_cos')*ima*conj(W_cos);
DCT_norm=log(abs(F_cos));
% DCT_i:𝝍=W⋅𝜳⋅𝑾^T
end