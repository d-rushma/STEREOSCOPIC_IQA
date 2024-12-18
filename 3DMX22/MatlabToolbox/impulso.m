function imprest = impulso(img,nivel);
I = im2double(im2double(img));
imprest = (I + nivel*rand(size(I)))/(1+nivel);
end

% va de 0-1 .1++