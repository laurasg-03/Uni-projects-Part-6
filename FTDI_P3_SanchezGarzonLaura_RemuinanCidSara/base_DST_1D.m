function W_sen=base_DST_1D(N)
[u,n]=meshgrid([0:N-1],[0:N-1]);
W_sen=(sqrt(2/N+1))*sin(((n+1).*(u+1)*pi)/(N+1));
end
