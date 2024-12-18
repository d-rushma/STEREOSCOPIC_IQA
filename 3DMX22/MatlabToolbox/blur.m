function blurrest = blur(img,nivel);
nivel = fspecial('disk',nivel);
blurrest = imfilter(img,nivel);  
end

%niveles de 0-10
