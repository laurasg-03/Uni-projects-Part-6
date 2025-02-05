clc
clear all
close all

%% representación de imágenes base
N=8;

basis_dct_2=cell(N,N);
for n=1:N
    for u=1:N
        basis_dct_2(n,u)=basis_dct_1(:,n)*(basis_dct_1(:,u)');
        %if basis_dct_1
    end
end

for (k=1:N)
    for (k=1:N)
    subplot(8,8,N*(k-1)+n);
    imshow(Ws(:,k)); hold on
    stem(Ws(:,k)); hold off
    end
end  