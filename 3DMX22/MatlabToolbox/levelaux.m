function varargout = levelaux(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @levelaux_OpeningFcn, ...
    'gui_OutputFcn',  @levelaux_OutputFcn, ...
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
function levelaux_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global nivel
set(handles.enviar,'Enable','off');
set(handles.text7,'String','Level Min: ');
set(handles.anterior,'String',nivel);
function varargout = levelaux_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

%Seleccion Nivel menu------------------------------------------------------
function niveles_Callback(hObject, eventdata, handles)
global opaux;
if get(handles.niveles,'Value')==1;
    set(handles.enviar,'Enable','off');
    set(handles.R_L,'Enable','off');
    %No nivel seleccionado-------------------------------------------------
elseif get(handles.niveles,'Value')==2;
    set(handles.enviar,'Enable','on');
    opaux=0.1;
elseif get(handles.niveles,'Value')==3;
    set(handles.enviar,'Enable','on');
    opaux=0.2;
elseif get(handles.niveles,'Value')==4;
    set(handles.enviar,'Enable','on');
    opaux=0.3;
elseif get(handles.niveles,'Value')==5;
    set(handles.enviar,'Enable','on');
    opaux=0.4;
elseif get(handles.niveles,'Value')==6;
    set(handles.enviar,'Enable','on');
    opaux=0.5;
end
function niveles_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Aplicar Ruido-------------------------------------------------------------
function enviar_Callback(hObject, eventdata, handles)
close ( );
