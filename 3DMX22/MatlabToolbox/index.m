function varargout = index(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @index_OpeningFcn, ...
    'gui_OutputFcn',  @index_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
%Inicializacion de botones value,visible-----------------------------------
function index_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
imagen=dir('cambia.png');
img=imread(imagen.name);
axes(handles.axes1);
image(img);
axis off
set(handles.Noise,'Enable','off');
set(handles.anaglyph,'Enable','off');
set(handles.ruidos,'Enable','off');
set(handles.save,'Enable','off');
set(handles.borrar,'Enable','off');
function varargout = index_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

%Subir Imagen--------------------------------------------------------------
function upload_Callback(hObject, eventdata, handles)
global entrada izq der opr folder;
opr = 0;
folder = 0;
[nombre,direccion] = uigetfile({'*.jpg;*.tif;*.png;*.jpeg;*.bmp'},'imgparestero');
if nombre == 0
    return
end
img = [direccion,nombre];
axes(handles.axes1);
p = imread(img);
image(p);
axis off
entrada = p;
[izq,der] = cortar(entrada);
set(handles.ruidos,'Enable','on');
set(handles.anaglyph,'Enable','on');
set(handles.ruidos,'Value',1);
set(handles.Noise,'Enable','off');

%Carptea Completa ---------------------------------------------------------
function pushbutton2_Callback(hObject, eventdata, handles)
set(handles.borrar,'Enable','on');
global folder ruta ruta1 Jpg Png;
folder = 1;
ruta = uigetdir;
if ruta == 0;
    return
end
ruta = [ruta,'\'];
system('md Noises');
system('move Noises C:\');
ruta1 =('C:\Noises\');
Jpg = dir([ruta,'*.jpg']);
Png = dir([ruta,'*.png']);
set(handles.ruidos,'Enable','on');
uiwait

%Guardar Imagen------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
Guardar
uiwait

%Funcion 3D ---------------------------------------------------------------
function anaglyph_Callback(hObject, eventdata, handles)
global result result3D opr entrada;
if opr == 1 | opr == 2 | opr == 3 | opr == 4 | opr == 5 | opr == 6 | opr == 7 | opr == 8;
    result3D = imaanaglifa(result);
    axes(handles.axes1);
    image(result3D);
    axis off
else
    result3D = imaanaglifa(entrada);
    axes(handles.axes1);
    image(result3D);
    axis off
end

%Abre GUIDE para la seleccion de niveles de ruido--------------------------
%Continua Programa Principal-----------------------------------------------
function Noise_Callback(hObject, eventdata, handles)
global  result folder ruta ruta1 Jpg Png opn opn1 opn2 opj opj2 opaux level;
if folder == 0;
    if get(handles.ruidos,'Value') == 2;
        level01_05
        uiwait
        axes(handles.axes1);
        image(result);
        axis off
        set(handles.anaglyph,'Enable','on');
        set(handles.save,'Enable','on');
    elseif get(handles.ruidos,'Value') == 3;
        level01_05
        uiwait
        axes(handles.axes1);
        image(result);
        axis off
        set(handles.anaglyph,'Enable','on');
        set(handles.save,'Enable','on');
    elseif get(handles.ruidos,'Value') == 4;
        level01_05
        uiwait
        axes(handles.axes1);
        image(result);
        axis off
        set(handles.anaglyph,'Enable','on');
        set(handles.save,'Enable','on');
    elseif get(handles.ruidos,'Value') == 5;
        level01_05
        uiwait
        axes(handles.axes1);
        image(result);
        axis off
        set(handles.anaglyph,'Enable','on');
        set(handles.save,'Enable','on');
    elseif get(handles.ruidos,'Value') == 6;
        level01_05
        uiwait
        axes(handles.axes1);
        image(result);
        axis off
        set(handles.anaglyph,'Enable','on');
        set(handles.save,'Enable','on');
    elseif get(handles.ruidos,'Value') == 7;
        level01_05
        uiwait
        axes(handles.axes1);
        image(result);
        axis off
        set(handles.anaglyph,'Enable','on');
        set(handles.save,'Enable','on');
    elseif get(handles.ruidos,'Value') == 8;
        level01_05
        uiwait
        axes(handles.axes1);
        image(result);
        axis off
        set(handles.anaglyph,'Enable','on');
        set(handles.save,'Enable','on');
    elseif get(handles.ruidos,'Value') == 9;
        level01_05
        uiwait
        axes(handles.axes1);
        image(result);
        axis off
        set(handles.anaglyph,'Enable','on');
        set(handles.save,'Enable','on');
    elseif get(handles.ruidos,'Value') == 10;
        level01_05
        uiwait
        axes(handles.axes1);
        image(result);
        axis off
        set(handles.anaglyph,'Enable','on');
        set(handles.save,'Enable','on');
    elseif get(handles.ruidos,'Value') == 11;
        level01_05
        uiwait
        axes(handles.axes1);
        image(result);
        axis off
        set(handles.anaglyph,'Enable','on');
        set(handles.save,'Enable','on');
    elseif get(handles.ruidos,'Value') == 12;
        level01_05
        uiwait
        imagen=dir('cambia.png');
        img=imread(imagen.name);
        axes(handles.axes1);
        image(img);
        axis off
        Gauss
        uiwait
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif folder ==1; %opciones para folder-----------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      if get(handles.ruidos,'Value') == 2;
        level01_05
        uiwait
        if size(Png,1) == 0;
            msgbox('No hay imagenes PNG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Png,1);
                Imagen=imread([ruta,Png(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = wgauss(izq,opn);
                rder = wgauss(der,opn);
                resultNoiseStereo = wgauss(Imagen,opn);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));                
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                
                Muestra = sprintf('0%d',i);
                              
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_01_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_01_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_01_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_01_',level,'_04.png']);
                
                waitbar(i/size(Png,1),bp);
            end
            close (bp);
        end
        
        if size(Jpg,1) == 0;
            msgbox('No hay imagenes JPG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Jpg,1);
                Imagen=imread([ruta,Jpg(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = wgauss(izq,opn);
                rder = wgauss(der,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = wgauss(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_01_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_01_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_01_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_01_',level,'_04.jpg']);
                
                waitbar(i/size(Jpg,1),bp);
            end
            close (bp);
        end
        msgbox(['Imagenes Guardadas en: ',ruta1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif get(handles.ruidos,'Value') == 3;
        level01_05
        uiwait
        if size(Png,1) == 0;
            msgbox('No hay imagenes PNG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Png,1);
                Imagen=imread([ruta,Png(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = impulso(izq,opn);
                rder = impulso(der,opn);
                resultNoiseRL = union (Imagen,rizq,rder);
                resultNoiseStereo = impulso(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                              
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_02_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_02_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_02_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_02_',level,'_04.png']);
                
                waitbar(i/size(Png,1),bp);
            end
            close (bp);
        end
        
        if size(Jpg,1) == 0;
            msgbox('No hay imagenes JPG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Jpg,1);
                Imagen=imread([ruta,Jpg(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = impulso(izq,opn);
                rder = impulso(der,opn);
                resultNoiseRL = union (Imagen,rizq,rder);
                resultNoiseStereo = impulso(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                       
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_02_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_02_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_02_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_02_',level,'_04.jpg']);
                
                waitbar(i/size(Jpg,1),bp);
            end
            close (bp);
        end
        msgbox(['Imagenes Guardadas en: ',ruta1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif get(handles.ruidos,'Value') == 4;
        level01_05
        uiwait
        if size(Png,1) == 0;
            msgbox('No hay imagenes PNG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Png,1);
                Imagen=imread([ruta,Png(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = localvar(izq,opn);
                rder = localvar(der,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = localvar(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                    
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_03_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_03_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_03_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_03_',level,'_04.png']);
                
                waitbar(i/size(Png,1),bp);
            end
            close (bp);
        end
        
        if size(Jpg,1) == 0;
            msgbox('No hay imagenes JPG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Jpg,1);
                Imagen=imread([ruta,Jpg(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = localvar(izq,opn);
                rder = localvar(der,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = localvar(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                     
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_03_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_03_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_03_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_03_',level,'_04.jpg']);
                
                waitbar(i/size(Jpg,1),bp);
            end
            close (bp);
        end
        msgbox(['Imagenes Guardadas en: ',ruta1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif get(handles.ruidos,'Value') == 5;
        level01_05
        uiwait
        if size(Png,1) == 0;
            msgbox('No hay imagenes PNG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Png,1);
                Imagen=imread([ruta,Png(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = Correlesp(izq,opn2);
                rder = Correlesp(der,opn2);
                resultNoiseRL = union (Imagen,rizq,rder);
                resultNoiseStereo = Correlesp(Imagen,opn2);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                   
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_04_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_04_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_04_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_04_',level,'_04.png']);
                
                waitbar(i/size(Png,1),bp);
            end
            close (bp);
        end
        
        if size(Jpg,1) == 0;
            msgbox('No hay imagenes JPG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Jpg,1);
                Imagen=imread([ruta,Jpg(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = Correlesp(izq,opn2);
                rder = Correlesp(der,opn2);
                resultNoiseRL = union (Imagen,rizq,rder);
                resultNoiseStereo = Correlesp(Imagen,opn2);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_04_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_04_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_04_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_04_',level,'_04.jpg']);
                
                waitbar(i/size(Jpg,1),bp);
            end
            close (bp);
        end
        msgbox(['Imagenes Guardadas en: ',ruta1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif get(handles.ruidos,'Value') == 6;
        level01_05
        uiwait
        if size(Png,1) == 0;
            msgbox('No hay imagenes PNG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Png,1);
                Imagen=imread([ruta,Png(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = saltpimienta(izq,opn);
                rder = saltpimienta(der,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = saltpimienta(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                         
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_05_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_05_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_05_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_05_',level,'_04.png']);
                
                waitbar(i/size(Png,1),bp);
            end
            close (bp);
        end
        
        if size(Jpg,1) == 0;
            msgbox('No hay imagenes JPG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Jpg,1);
                Imagen=imread([ruta,Jpg(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = saltpimienta(izq,opn);
                rder = saltpimienta(der,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = saltpimienta(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                      
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_05_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_05_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_05_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_05_',level,'_04.jpg']);;
                
                waitbar(i/size(Jpg,1),bp);
            end
            close (bp);
        end
        msgbox(['Imagenes Guardadas en: ',ruta1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif get(handles.ruidos,'Value') == 7;
        level01_05
        uiwait
        if size(Png,1) == 0;
            msgbox('No hay imagenes PNG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Png,1);
                Imagen=imread([ruta,Png(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = Salpicar(izq,opn);
                rder = Salpicar(der,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = Salpicar(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                        
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_06_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_06_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_06_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_06_',level,'_04.png']);
                
                waitbar(i/size(Png,1),bp);
            end
            close (bp);
        end
        
        if size(Jpg,1) == 0;
            msgbox('No hay imagenes JPG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Jpg,1);
                Imagen=imread([ruta,Jpg(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = Salpicar(izq,opn);
                rder = Salpicar(der,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = Salpicar(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                        
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_06_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_06_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_06_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_06_',level,'_04.jpg']);
                
                waitbar(i/size(Jpg,1),bp);
            end
            close (bp);
        end
        msgbox(['Imagenes Guardadas en: ',ruta1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif get(handles.ruidos,'Value') == 8;
        level01_05
        uiwait
        if size(Png,1) == 0;
            msgbox('No hay imagenes PNG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Png,1);
                Imagen=imread([ruta,Png(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = blur(izq,opn1);
                rder = blur(der,opn1);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = blur(Imagen,opn1);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                       
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_07_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_07_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_07_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_07_',level,'_04.png']);
                
                waitbar(i/size(Png,1),bp);
            end
            close (bp);
        end
        
        if size(Jpg,1) == 0;
            msgbox('No hay imagenes JPG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Jpg,1);
                Imagen=imread([ruta,Jpg(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = blur(izq,opn1);
                rder = blur(der,opn1);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = blur(Imagen,opn1);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                      
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_07_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_07_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_06_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_07_',level,'_04.jpg']);
                
                waitbar(i/size(Jpg,1),bp);
            end
            close (bp);
        end
        msgbox(['Imagenes Guardadas en: ',ruta1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif get(handles.ruidos,'Value') == 9;
        level01_05
        uiwait
        if opn >= opaux;
            opaux = opaux + 0.1;
        end
        if size(Png,1) == 0;
            msgbox('No hay imagenes PNG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Png,1);
                Imagen=imread([ruta,Png(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = Contraste(izq,opaux,opn);
                rder = Contraste(der,opaux,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = uint8(Contraste(Imagen,opaux,opn));
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                         
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_08_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_08_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_08_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_08_',level,'_04.png']);
                
                waitbar(i/size(Png,1),bp);
            end
            close (bp);
        end
        
        if size(Jpg,1) == 0;
            msgbox('No hay imagenes JPG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Jpg,1);
                Imagen=imread([ruta,Jpg(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = Contraste(izq,opaux,opn);
                rder = Contraste(der,opaux,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = uint8(Contraste(Imagen,opaux,opn));
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                        
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_08_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_08_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_08_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_08_',level,'_04.jpg']);
                
                waitbar(i/size(Jpg,1),bp);
            end
            close (bp);
        end
        msgbox(['Imagenes Guardadas en: ',ruta1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif get(handles.ruidos,'Value') == 10;
        level01_05
        uiwait
        if size(Png,1) == 0;
            msgbox('No hay imagenes PNG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Png,1);
                Imagen=imread([ruta,Png(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = NoiseJpg(izq,opj);
                rder = NoiseJpg(der,opj);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = uint8(NoiseJpg(Imagen,opj));
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                         
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_09_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_09_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_09_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_09_',level,'_04.png']);
                
                waitbar(i/size(Png,1),bp);
            end
            close (bp);
        end
        
        if size(Jpg,1) == 0;
            msgbox('No hay imagenes JPG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Jpg,1);
                Imagen=imread([ruta,Jpg(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = NoiseJpg(izq,opj);
                rder = NoiseJpg(der,opj);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = uint8(NoiseJpg(Imagen,opj));
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                        
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_09_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_09_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_09_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_09_',level,'_04.jpg']);
                
                waitbar(i/size(Jpg,1),bp);
            end
            close (bp);
        end
        msgbox(['Imagenes Guardadas en: ',ruta1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif get(handles.ruidos,'Value') == 11;
        level01_05
        uiwait
        if size(Png,1) == 0;
            msgbox('No hay imagenes PNG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Png,1);
                Imagen=imread([ruta,Png(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = NoiseJ2k(izq,opj2);
                rder = NoiseJ2k(der,opj2);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = uint8(NoiseJ2k(Imagen,opj2));
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                         
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_10_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_10_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_10_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_10_',level,'_04.png']);
                
                waitbar(i/size(Png,1),bp);
            end
            close (bp);
        end
        
        if size(Jpg,1) == 0;
            msgbox('No hay imagenes JPG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Jpg,1);
                Imagen=imread([ruta,Jpg(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = NoiseJ2k(izq,opj2);
                rder = NoiseJ2k(der,opj2);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = uint8(NoiseJ2k(Imagen,opj2));
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                        
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_10_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_10_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_10_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_10_',level,'_04.jpg']);
                
                waitbar(i/size(Jpg,1),bp);
            end
            close (bp);
        end
        msgbox(['Imagenes Guardadas en: ',ruta1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif get(handles.ruidos,'Value') == 12;
        level01_05
        uiwait
        if opn >= opaux;
            opaux = opaux + 0.1;
        end
        if size(Png,1) == 0;
            msgbox('No hay imagenes PNG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Png,1);
                Imagen=imread([ruta,Png(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = wgauss(izq,opn);
                rder = wgauss(der,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = wgauss(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
 
                Muestra = sprintf('0%d',i);
                         
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_01_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_01_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_01_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_01_',level,'_04.png']);          
%--------------------------------------------------------------------------
                rizq = impulso(izq,opn);
                rder = impulso(der,opn);
                resultNoiseRL = union (Imagen,rizq,rder);
                resultNoiseStereo = impulso(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
 
                Muestra = sprintf('0%d',i);
                       
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_02_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_02_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_02_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_02_',level,'_04.png']);
%--------------------------------------------------------------------------
                rizq = localvar(izq,opn);
                rder = localvar(der,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = localvar(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
 
                Muestra = sprintf('0%d',i);
                        
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_03_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_03_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_03_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_03_',level,'_04.png']);
%--------------------------------------------------------------------------
                rizq = Correlesp(izq,opn2);
                rder = Correlesp(der,opn2);
                resultNoiseRL = union (Imagen,rizq,rder);
                resultNoiseStereo = Correlesp(Imagen,opn2);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
 
                Muestra = sprintf('0%d',i);
                       
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_04_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_04_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_04_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_04_',level,'_04.png']);
%--------------------------------------------------------------------------
                rizq = saltpimienta(izq,opn);
                rder = saltpimienta(der,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = saltpimienta(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
 
                Muestra = sprintf('0%d',i);
                       
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_05_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_05_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_05_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_05_',level,'_04.png']);
%--------------------------------------------------------------------------
                rizq = Salpicar(izq,opn);
                rder = Salpicar(der,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = Salpicar(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
    
                Muestra = sprintf('0%d',i);
                      
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_06_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_06_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_06_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_06_',level,'_04.png']);
%--------------------------------------------------------------------------
                rizq = blur(izq,opn1);
                rder = blur(der,opn1);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = blur(Imagen,opn1);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
 
                Muestra = sprintf('0%d',i);
                      
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_07_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_07_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_07_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_07_',level,'_04.png']);
%--------------------------------------------------------------------------
                rizq = Contraste(izq,opaux,opn);
                rder = Contraste(der,opaux,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = uint8(Contraste(Imagen,opaux,opn));
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
 
                Muestra = sprintf('0%d',i);
                
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_08_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_08_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_08_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_08_',level,'_04.png']);
%--------------------------------------------------------------------------
                rizq = NoiseJpg(izq,opj);
                rder = NoiseJpg(der,opj);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = uint8(NoiseJpg(Imagen,opj));
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                         
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_09_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_09_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_09_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_09_',level,'_04.png']);
%--------------------------------------------------------------------------
                rizq = NoiseJ2k(izq,opj2);
                rder = NoiseJ2k(der,opj2);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = uint8(NoiseJ2k(Imagen,opj2));
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                         
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.png']);
                imwrite(rizq,[ruta1,Muestra,'_10_',level,'_01.png']);
                imwrite(rder,[ruta1,Muestra,'_10_',level,'_02.png']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_10_',level,'_03.png']);
                imwrite(result3D,[ruta1,Muestra,'_10_',level,'_04.png']);
%--------------------------------------------------------------------------
                waitbar(i/size(Png,1),bp);
            end
            close (bp);
        end
        
        if size(Jpg,1) == 0;
            msgbox('No hay imagenes JPG');
            uiwait
        else
            bp=waitbar(0,'Applying Noise...');
            for i=1:1:size(Jpg,1);
                Imagen=imread([ruta,Jpg(i).name]);
                [izq,der] = cortar(Imagen);
                rizq = wgauss(izq,opn);
                rder = wgauss(der,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = wgauss(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                    
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_01_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_01_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_01_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_01_',level,'_04.jpg']);           
%--------------------------------------------------------------------------
                rizq = impulso(izq,opn);
                rder = impulso(der,opn);
                resultNoiseRL = union (Imagen,rizq,rder);
                resultNoiseStereo = impulso(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                        
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_02_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_02_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_02_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_02_',level,'_04.jpg']);
%--------------------------------------------------------------------------
                rizq = localvar(izq,opn);
                rder = localvar(der,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = localvar(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                       
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_03_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_03_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_03_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_03_',level,'_04.jpg']);
%--------------------------------------------------------------------------
                rizq = Correlesp(izq,opn2);
                rder = Correlesp(der,opn2);
                resultNoiseRL = union (Imagen,rizq,rder);
                resultNoiseStereo = Correlesp(Imagen,opn2);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                        
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_04_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_04_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_04_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_04_',level,'_04.jpg']);
%--------------------------------------------------------------------------
                rizq = saltpimienta(izq,opn);
                rder = saltpimienta(der,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = saltpimienta(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                       
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_05_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_05_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_05_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_05_',level,'_04.jpg']);
%--------------------------------------------------------------------------
                rizq = Salpicar(izq,opn);
                rder = Salpicar(der,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = Salpicar(Imagen,opn);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                    
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_06_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_06_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_06_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_06_',level,'_04.jpg']);
%--------------------------------------------------------------------------
                rizq = blur(izq,opn1);
                rder = blur(der,opn1);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = blur(Imagen,opn1);
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                        
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_07_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_07_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_07_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_07_',level,'_04.jpg']);
%--------------------------------------------------------------------------
                rizq = Contraste(izq,opaux,opn);
                rder = Contraste(der,opaux,opn);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = uint8(Contraste(Imagen,opaux,opn));
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                      
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_08_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_08_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_08_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_08_',level,'_04.jpg']);
%--------------------------------------------------------------------------
                rizq = NoiseJpg(izq,opj);
                rder = NoiseJpg(der,opj);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = uint8(NoiseJpg(Imagen,opj));
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                        
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_09_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_09_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_09_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_09_',level,'_04.jpg']);
%--------------------------------------------------------------------------
                rizq = NoiseJ2k(izq,opj2);
                rder = NoiseJ2k(der,opj2);
                resultNoiseRL = uint8(union (Imagen,rizq,rder));
                resultNoiseStereo = uint8(NoiseJ2k(Imagen,opj2));
                result3DNoiseRL = imaanaglifa(resultNoiseRL);
                result3D = imaanaglifa(resultNoiseStereo);
                result3DOrg = imaanaglifa(Imagen);
                
                Muestra = sprintf('0%d',i);
                        
                imwrite(result3DOrg,[ruta1,Muestra,'_00_04.jpg']);
                imwrite(rizq,[ruta1,Muestra,'_10_',level,'_01.jpg']);
                imwrite(rder,[ruta1,Muestra,'_10_',level,'_02.jpg']);
                imwrite(resultNoiseStereo,[ruta1,Muestra,'_10_',level,'_03.jpg']);
                imwrite(result3D,[ruta1,Muestra,'_10_',level,'_04.jpg']);
%--------------------------------------------------------------------------
            waitbar(i/size(Jpg,1),bp);
            end
            close (bp);
        end
        msgbox(['Imagenes Guardadas en: ',ruta1]);
    end
    
end

%menu ruidos---------------------------------------------------------------
function ruidos_Callback(hObject, eventdata, handles)
global opr entrada folder;
if folder == 0;
    if get(handles.ruidos,'Value') == 1;
        % No hay seleccion de ruido----------------------------------------
        axes(handles.axes1);
        image(entrada);
        axis off
        opr = 0;
        set(handles.Noise,'Enable','off');
        set(handles.anaglyph,'Enable','on');
    elseif get(handles.ruidos,'Value') == 2;
        opr=1;%Gauss-------------------------------------------------------
        axes(handles.axes1);
        image(entrada);
        axis off
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 3;
        opr=2;%Impulso-----------------------------------------------------
        axes(handles.axes1);
        image(entrada);
        axis off
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 4;
        opr=3;%Localvar----------------------------------------------------
        axes(handles.axes1);
        image(entrada);
        axis off
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 5;
        opr=4;%Spatial correlation-----------------------------------------
        axes(handles.axes1);
        image(entrada);
        axis off
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 6;
        opr=5;%Salt & Pepper-----------------------------------------------
        axes(handles.axes1);
        image(entrada);
        axis off
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 7;
        opr=6;%Speckle-----------------------------------------------------
        axes(handles.axes1);
        image(entrada);
        axis off
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 8;
        opr=7;%Blur--------------------------------------------------------
        axes(handles.axes1);
        image(entrada);
        axis off
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 9;
        opr=8;%Contrast----------------------------------------------------
        axes(handles.axes1);
        image(entrada);
        axis off
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 10;
        opr=9;%JPG---------------------------------------------------------
        axes(handles.axes1);
        image(entrada);
        axis off
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 11;
        opr=10;%J2K--------------------------------------------------------
        axes(handles.axes1);
        image(entrada);
        axis off
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 12;
        opr=11;%All Noises-------------------------------------------------
        axes(handles.axes1);
        image(entrada);
        axis off
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    end
else
    if get(handles.ruidos,'Value') == 1;
        % No hay seleccion de ruido----------------------------------------
        axes(handles.axes1);
        set(handles.Noise,'Enable','off');
        set(handles.anaglyph,'Enable','on');
    elseif get(handles.ruidos,'Value') == 2;
        opr=1;%Gauss-------------------------------------------------------
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 3;
        opr=2;%Impulso-----------------------------------------------------
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 4;
        opr=3;%Localvar----------------------------------------------------
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 5;
        opr=4;%Spatial correlation-----------------------------------------
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 6;
        opr=5;%Salt & Pepper-----------------------------------------------
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 7;
        opr=6;%Speckle-----------------------------------------------------
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 8;
        opr=7;%Blur--------------------------------------------------------
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 9;
        opr=8;%Contrast----------------------------------------------------
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    elseif get(handles.ruidos,'Value') == 10;
        opr=9;%JPG---------------------------------------------------------
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');      
    elseif get(handles.ruidos,'Value') == 11;
        opr=10;%J2K--------------------------------------------------------
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');        
    elseif get(handles.ruidos,'Value') == 12;
        opr=11;%All Noises-------------------------------------------------
        set(handles.Noise,'Enable','on');
        set(handles.anaglyph,'Enable','off');
    end
    
end
function ruidos_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Borra carpeta creada para el contenedor de imagenes automaticas-----------
function borrar_Callback(hObject, eventdata, handles)
%system('move Noises C:\')
system('DEL /s /q "C:\Noises\*.*"');
msgbox('Imagenes Eliminadas');
uiwait
