function gauss = wgauss(img,nivel);
N = double(nivel);
gauss = imnoise(img,'gaussian',0,N);
end

%niveles de 0-0.5