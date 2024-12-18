function [izq,der] = cortar(imagen);
%DERECHA
der = imagen(:,1:(end/2),:);
%IZQUIERDA
izq = imagen(:,(end/2)+1:end,:);
end