function guardarimg(imagen)

[nombre,ruta]=uiputfile({'*.png;'},'Guardar');
if nombre==0
    return
end
fname=fullfile(ruta,nombre);
imwrite(imagen,fname)