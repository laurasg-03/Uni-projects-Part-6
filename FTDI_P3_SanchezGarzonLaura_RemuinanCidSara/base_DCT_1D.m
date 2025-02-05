function W_cos=base_DCT_1D(N)
[u,n]=meshgrid([0:N-1],[0:N-1]);
W_cos=(sqrt(2/N))*cos((2*n+1)*pi.*u/(2*N));
W_cos(:,1)=(1/sqrt(N)); %(:,1) representa todas las filas de la matriz W pero solo la (hasta la) primera columna.
end