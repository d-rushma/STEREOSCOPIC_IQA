function ima3d = imaanaglifa(img); %mapadisp
imagen = img;
[izq,der] = cortar(imagen);
ima3d = stereoAnaglyph(izq,der);
end