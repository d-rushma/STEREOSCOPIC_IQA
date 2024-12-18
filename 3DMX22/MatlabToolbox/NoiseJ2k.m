function resultado = NoiseJ2k (imagen,opcion);
imwrite(imagen,'img_aux.jp2','CompressionRatio',opcion);
resultado=imread('img_aux.jp2');
system('DEL /s /q "img_aux.jp2"');
imwrite(resultado,'rest.png');
resultado = imread('rest.png');
system('DEL /s /q "rest.png"');
end