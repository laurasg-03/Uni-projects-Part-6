function W_cos_2D=base_DCT_2D(N)
 
for n=1:N
    for u=1:N
       W_cos_2D(n,u)=base_DCT_1D(:,n)*(base_DCT_1D(:,u)');
        if W_cos_2D(:,1)==1
            W_cos_2D=W_cos_2D*(N/2);
        else
            W_cos_2D=W_cos_2D*(N/sqrt(2));
        end
    end
end
end