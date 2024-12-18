function salpimientarest = saltpimienta(img,nivel);
salpimientarest = imnoise(img,'salt & pepper', nivel);
end

% va de 0-0.5 .1++