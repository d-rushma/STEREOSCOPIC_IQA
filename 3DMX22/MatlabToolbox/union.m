function resultado = union (entrada,imagenizq,imagender);
resultado = zeros(size(entrada));
resultado(:,1:size(imagenizq,2),:)=imagenizq(:,:,:);
resultado(:,(size(resultado,2)/2)+1:size(resultado,2),:)=imagender(:,:,:);
end
