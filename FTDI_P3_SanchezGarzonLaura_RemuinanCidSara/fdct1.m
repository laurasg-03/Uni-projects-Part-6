function basis_dct_1=fdct1(N)
[u,n]=meshgrid([0:N-1],[0:N-1]);
basis_dct_1=(sqrt(2/N))*cos((2*n+1)*pi.*u/(2*N));
basis_dct_1(:,1)=(1/sqrt(N));
end