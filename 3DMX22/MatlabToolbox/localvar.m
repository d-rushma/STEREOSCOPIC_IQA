function localvarresult = Localvar (img,nivel)
localvarresult = imnoise(img,'localvar',nivel*rand(size(img))); 
end

%0-0.05 0.01++