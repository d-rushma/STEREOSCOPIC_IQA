function resultado = NoiseJpg (imagen,opcion);
imwrite(imagen,'img_aux.jpg','Quality',opcion);
resultado=imread('img_aux.jpg');
system('DEL /s /q "img_aux.jpg"');
imwrite(resultado,'rest.png');
resultado = imread('rest.png');
system('DEL /s /q "rest.png"');
end