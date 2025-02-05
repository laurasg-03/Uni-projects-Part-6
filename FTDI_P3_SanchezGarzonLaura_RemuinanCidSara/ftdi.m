classdef ftdi
    methods     ( Static = true )
        function ima_gray_double_norm=ind2gray_double(dir)
            % IND2GRAY_DOUBLE(DIR) Devuelve la imagen del directorio dado
            % en formato double normalizado (entre 0 y 1) y gris
            % dir = imagen dada (sin leer) 
            [ima,map]=imread(dir);
            ima_gray=ind2gray(ima, map);
            ima_gray_double_norm=im2double(ima_gray);
        end

        function e_ima=energia(ima)
            % ENERGIA(IMA) Calcula la energía de la imagen "ima".
            % ima = imagen de tipo double de la que se calcula la energía
            % ima: matriz 2D tipo double
            e_ima=sum(sum(ima.*ima));
        end

        function W=nucleo_dct(N)
            % NUCLEO_DCT(N) Calcular la matriz núcleo de la DCT.
            % N = ancho de la imágen a la que se quiere aplicar la DCT
            % N: int
            [u,n]=meshgrid([0:N-1],[0:N-1]);
            W=(sqrt(2/N))*cos((2*n+1)*pi.*u/(2*N));
            W(:,1)=(1/sqrt(N)); 
        end
        
        function W=nucleo_dst(N)
            % NUCLEO_DST(N) Devuelve la matriz núcleo de la DST.
            % N = ancho de la imágen a la que se quiere aplicar la DST
            % N: int
            [u,n]=meshgrid([0:N-1],[0:N-1]);
            W=(sqrt(2/(N+1)))*sin((n+1).*(u+1)*pi/(N+1));
        end
        
        function IMA_TD=td_2D(ima,W)
            % TD_2D(IMA,W) Devuelve la transformada directa de ima mediante
            % el núcleo W.
            % ima = imagen que se quiere transformar
            % W = núcleo de transformación
            IMA_TD=conj(W)'*ima*conj(W);
        end
        
        function ima_ti=ti_2D(IMA_TD,W)
            % TD_2D(IMA,W) Devuelve la transformada directa de ima mediante
            % el núcleo W. 
            % ima = imagen que se quiere transformar
            % W = núcleo de transformación
            ima_ti=W*IMA_TD*W';
        end

        function vectores_base(W,N)
            % VECTORES_BASE(W,N) Devuelve la representación gráfica de los
            % vectores base del núcleo de transformación W de anchura N.
            % W = núcleo de transformación
            % N = ancho de la imágen a la que se quiere aplicar W
            % N: int
            % W: array

            for i=1:N
                cadena=sprintf("k=%d",i);
                subplot(N,1,i), stem(W(:,i)), title(cadena);
                hold on, plot(W(:,i));
            end
            cadena2=sprintf("Vecores base 1D N=%",N);
            sgtitle(cadena2)
        end 

        function imagenes_base_dct(W,N)
            % IMAGENES_BASE_DCT(W,N) Devuelve la representación gráfica de
            % las imágenes base (producto de kronecker) del núcleo de la
            % DCT W de anchura N.
            % W = núcleo de transformación de la DCT
            % N = ancho de la imágen a la que se quiere aplicar W
            % N: int
            % W: array

            for i=1:N
                for j=1:N
                    if i==1 | j==1
                        ima=W(:,i)*W(:,j)'*N/sqrt(2);
                    else
                        ima=W(:,i)*W(:,j)'*N/2;
                    end
                subplot(N,N,(i-1)*N + j), imshow(ima)
                end
            end
        end

        function imagenes_base_dst(W,N)
            % IMAGENES_BASE_DST(W,N) Devuelve la representación gráfica de
            % las imágenes base (producto de kronecker) del núcleo de la
            % DST W de anchura N.
            % W = núcleo de transformación de la DCT
            % N = ancho de la imágen a la que se quiere aplicar W
            % N: int
            % W: array
            
            for i = 1:N
                for j = 1:N
                    if j==1 | i==1
                        ima = W(:,i) * W(:,j)'*(N/sqrt(2));
                    else
                        ima = W(:,i) * W(:,j)'*(N/2);
                    end
                    
                    subplot(N,N,(i-1)*8+j); imshow(ima); title([num2str(i-1), ',', num2str(j-1)])
                end
            end
        end

        function dist_nrj_ima=dist_energia(ima,K)
            % DIST_ENERGIA(IMA,K) Devuelve la distribuci
            e_ima=ftdi.energia(ima);
            func=@(x) ftdi.energia(x)/e_ima*100;
            dist_nrj_ima=blkproc(ima,[K,K],func);
        end




    end
end