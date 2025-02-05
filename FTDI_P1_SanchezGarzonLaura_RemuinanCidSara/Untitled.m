% Ejercicio 1.3: lectura de imágenes a partir de un archivo

[ima1,map1]=imread('MRI_pseudo_colored.jpg');  
% No map, 3D: true color a color 
[ima2,map2]=imread('CT_abdomen.jpg');
% No map, 2D: true color escala de grises 
[ima3,map3]=imread('Skin.tif');
% mapa 3col (RGB): imagen indexada a color 
[ima4,map4]=imread('Xray_th.tif');
% No mapa, tipo logical:binaria

figure 
subplot(221); imshow(ima1);
title('MRI_pseudo_colored.jpg')
subplot(222); imshow(ima2);
title('CT_abdomen.jpg')
subplot(223); imshow(ima3,map3);
title('Skin.tif')
subplot(224); imshow(ima4);
title('Xray_th.tif')

% Cambio de true color a indexada: 
[ima1_vlt, map1] = rgb2ind(ima1, 256); 
% True color grises a indexada
[ima2_vlt, map2] = gray2ind(ima2, 256); 
% Indexada a true color: 
ima3_tc = ind2rgb(ima3, map3); 
% Binaria a indexada: 
[ima4_vlt, map4] = gray2ind(ima4, 256);

figure 
subplot(221); imshow(ima1_vlt, map1);
title('MRI_pseudo_colored.jpg')
subplot(222); imshow(ima2_vlt, map2);
title('CT_abdomen.jpg')
subplot(223); imshow(ima3_tc);
title('Skin.tif')
subplot(224); imshow(ima4_vlt, map4);
title('Xray_th.tif')