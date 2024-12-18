function correlespresult = Correlesp (img,nivel);
 Io=im2double(img);
 sigma_n=nivel; 
 randn('seed', 0);
 correlespresult=Io+sigma_n/255*randn(size(Io));
end

% de 10 a 50 10++

% bp=waitbar(0,'Looking for pedestrians...');
% 
% a=dir([ruta,'2D*.jpg']);
% for i=1:1:size(a,1)
 %Imagen=imread([ruta,a(i).name]);
 %NoImage=sprintf('mascara00%d',i);
 %imwrite(CT_Image,[ruta1,NoImage,'.tif']);
% waitbar(i/size(a,1),bp);


%system('md Noises')
%system('move Noises C:\')
%system('DEL /s /q "C:\Noises\*.*"');