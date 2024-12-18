function contrasteresult = Contraste (img,nivela,nivelb);
contrasteresult = imadjust(img,[nivelb nivela],[]);
end

%de 0-1 de .1++ dos niveles