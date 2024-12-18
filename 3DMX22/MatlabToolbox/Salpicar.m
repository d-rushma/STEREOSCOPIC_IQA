function salpicarresult = Salpicar (img,nivel);
salpicarresult = imnoise(img,'speckle',nivel);
end

% de 0-1 de 0.1 ++