function varargout = level01_05(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @level01_05_OpeningFcn, ...
    'gui_OutputFcn',  @level01_05_OutputFcn, ...
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
%Inicializar botones-------------------------------------------------------
function level01_05_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global folder;
if folder == 1
    set(handles.R_L,'Visible','off');
end
set(handles.enviar,'Enable','off');
set(handles.R_L,'Enable','off');

function varargout = level01_05_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

%Seleccion Nivel menu------------------------------------------------------
function niveles_Callback(hObject, eventdata, handles)
global opn opn1 opn2 opr nivel level opj opj2;

if get(handles.niveles,'Value')==1;
    set(handles.enviar,'Enable','off');
    set(handles.R_L,'Enable','off');
    %No nivel seleccionado-------------------------------------------------
elseif get(handles.niveles,'Value')==2;
    nivel = 'Nivel 1';
    level = '01';
    set(handles.enviar,'Enable','on');
    set(handles.R_L,'Enable','on');
    opn=0.1;%nivel 1-------------------------------------------------------
    opn1=1;
    opn2=10;
    opj = 90;
    opj2 = 600;
    if opr == 8 | opr == 11
        levelaux
        uiwait
    end
    
elseif get(handles.niveles,'Value')==3;
    nivel = 'Nivel 2';
    level = '02';
    set(handles.enviar,'Enable','on');
    set(handles.R_L,'Enable','on');
    opn=0.2;%nivel 2-------------------------------------------------------
    opn1=2;
    opn2=20;
    opj = 75;
    opj2 = 1000;
    if opr == 8 | opr == 11
        levelaux
        uiwait
    end
    
elseif get(handles.niveles,'Value')==4;
    nivel = 'Nivel 3';
    level = '03';
    set(handles.enviar,'Enable','on');
    set(handles.R_L,'Enable','on');
    opn=0.3;%nivel 3-------------------------------------------------------
    opn1=3;
    opn2=30;
    opj = 50;
    opj2 = 1800;
    if opr == 8 | opr == 11
        levelaux
        uiwait
    end
    
elseif get(handles.niveles,'Value')==5;
    nivel = 'Nivel 4';
    level = '04';
    set(handles.enviar,'Enable','on');
    set(handles.R_L,'Enable','on');
    opn=0.4;%nivel 4-------------------------------------------------------
    opn1=4;
    opn2=40;
    opj = 25;
    opj2 = 2800;
    if opr == 8 | opr == 11
        levelaux
        uiwait
    end
    
elseif get(handles.niveles,'Value')==6;
    nivel = 'Nivel 5';
    level = '05';
    set(handles.enviar,'Enable','on');
    set(handles.R_L,'Enable','on');
    opn=0.5;%nivel 5-------------------------------------------------------
    opn1=5;
    opn2=50;
    opj = 0;
    opj2 = 3800;
    if opr == 8 | opr == 11
        levelaux
        uiwait
    end


end
function niveles_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Aplicar Ruido-------------------------------------------------------------
function enviar_Callback(hObject, eventdata, handles)
global entrada folder opn  opn1 opn2 opj opj2 opaux result r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 opr izq der;
if folder == 0%No opcion de Carpeta----------------------------------------
%Noise Gauss---------------------------------------------------------------    
    if opr == 1
        if get(handles.R_L,'Value') == 1;
            rizq = wgauss(izq,opn);
            rder = wgauss(der,opn);
            result = uint8(union (entrada,rizq,rder));
        else
            result = wgauss(entrada,opn);
        end
%Noise Impulso-------------------------------------------------------------        
    elseif opr == 2
        if get(handles.R_L,'Value') == 1;
            rizq = impulso(izq,opn);
            rder = impulso(der,opn);
            result = union (entrada,rizq,rder);
        else
            result = impulso(entrada,opn);
        end
%Noise Localvar------------------------------------------------------------        
    elseif opr == 3
        if get(handles.R_L,'Value') == 1;
            rizq = localvar(izq,opn);
            rder = localvar(der,opn);
            result = uint8(union (entrada,rizq,rder));
        else
            result = localvar(entrada,opn);
        end
%Noise Correlacion---------------------------------------------------------        
    elseif opr == 4
        if get(handles.R_L,'Value') == 1;
            rizq = Correlesp(izq,opn2);
            rder = Correlesp(der,opn2);
            result = union (entrada,rizq,rder);
        else
            result = Correlesp(entrada,opn2);
        end
%Noise Salt&Pepper---------------------------------------------------------        
    elseif opr == 5
        if get(handles.R_L,'Value') == 1;
            rizq = saltpimienta(izq,opn);
            rder = saltpimienta(der,opn);
            result = uint8(union (entrada,rizq,rder));
        else
            result = saltpimienta(entrada,opn);
        end
%Noise Salpicar------------------------------------------------------------        
    elseif opr == 6
        if get(handles.R_L,'Value') == 1;
            rizq = Salpicar(izq,opn);
            rder = Salpicar(der,opn);
            result = uint8(union (entrada,rizq,rder));
        else
            result = Salpicar(entrada,opn);
        end
%Noise Blur----------------------------------------------------------------        
    elseif opr == 7
        if get(handles.R_L,'Value') == 1;
            rizq = blur(izq,opn1);
            rder = blur(der,opn1);
            result = uint8(union (entrada,rizq,rder));
        else
            result = blur(entrada,opn1);
        end
%Noise Constraste----------------------------------------------------------        
    elseif opr == 8
        if opn >= opaux;
            opaux = opaux + 0.1;
        end
        if get(handles.R_L,'Value') == 1;
            
            rizq = Contraste (izq,opaux,opn);
            rder = Contraste (der,opaux,opn);
            result = uint8(union (entrada,rizq,rder));
        else
            result = uint8(Contraste (entrada,opaux,opn));
        end
%Noise JPG-----------------------------------------------------------------   
    elseif opr == 9
        if get(handles.R_L,'Value') == 1;
            rizq = NoiseJpg(izq,opj);
            rder = NoiseJpg(der,opj);
            result = uint8(union (entrada,rizq,rder));
        else
            result = NoiseJpg(entrada,opj);
        end
%Noise J2K----------------------------------------------------------------- 
    elseif opr == 10
        if get(handles.R_L,'Value') == 1;
            rizq = NoiseJ2k(izq,opj2);
            rder = NoiseJ2k(der,opj2);
            result = uint8(union (entrada,rizq,rder));
        else
            result = NoiseJ2k(entrada,opj2);
        end
%All Noises----------------------------------------------------------------        
    elseif opr == 11
        
        if opn >= opaux;
            opaux = opaux + 0.1;
        end
        
        if get(handles.R_L,'Value') == 1;
            rizq = wgauss(izq,opn);
            rder = wgauss(der,opn);
            r1 = uint8(union (entrada,rizq,rder));
            rizq2 = impulso(izq,opn);
            rder2 = impulso(der,opn);
            r2 = union (entrada,rizq2,rder2);
            rizq3 = localvar(izq,opn);
            rder3 = localvar(der,opn);
            r3 = uint8(union (entrada,rizq3,rder3));
            rizq4 = Correlesp(izq,opn2);
            rder4 = Correlesp(der,opn2);
            r4 = union (entrada,rizq4,rder4);
            rizq5 = saltpimienta(izq,opn);
            rder5 = saltpimienta(der,opn);
            r5 = uint8(union (entrada,rizq5,rder5));
            rizq6 = Salpicar(izq,opn);
            rder6 = Salpicar(der,opn);
            r6 = uint8(union (entrada,rizq6,rder6));
            rizq7 = blur(izq,opn1);
            rder7 = blur(der,opn1);
            r7 = uint8(union (entrada,rizq7,rder7));
            rizq8 = Contraste (izq,opaux,opn);
            rder8 = Contraste (der,opaux,opn);
            r8 = uint8(union (entrada,rizq8,rder8));
            rizq9 = NoiseJpg(izq,opj);
            rder9 = NoiseJpg(der,opj);
            r9 = uint8(union (entrada,rizq9,rder9));
            rizq10 = NoiseJ2k(izq,opj2);
            rder10 = NoiseJ2k(der,opj2);
            r10 = unit8(union(entrada,rizq10,rder10));
            
        else
            r1 = wgauss(entrada,opn);
            r2 = impulso(entrada,opn);
            r3 = localvar(entrada,opn);
            r4 = Correlesp(entrada,opn2);
            r5 = saltpimienta(entrada,opn);
            r6 = Salpicar(entrada,opn);
            r7 = blur(entrada,opn1);
            r8 = uint8(Contraste (entrada,opaux,opn));
            r9 = NoiseJpg(entrada,opj);
            r10 = NoiseJ2k(entrada,opj2);
        end
    else
        if opr == 8 | opr == 11
        levelaux
        uiwait
    end
    end
end
close ( );

%Ruido imagenes por separado-----------------------------------------------
function R_L_Callback(hObject, eventdata, handles)
