function varargout = Guardar(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Guardar_OpeningFcn, ...
    'gui_OutputFcn',  @Guardar_OutputFcn, ...
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
function Guardar_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
global op op1;
guidata(hObject, handles);
set(handles.sterostopic,'Value',0);
set(handles.L_R,'Value',0);
set(handles.anaglyph,'Value',0);
set(handles.enviar,'Enable','off');
function varargout = Guardar_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;

function L_R_Callback(hObject, eventdata, handles)
if get(handles.L_R,'Value') == 1;
    set(handles.sterostopic,'Enable','off');
    set(handles.anaglyph,'Enable','off')
    set(handles.enviar,'Enable','on');
    set(handles.sterostopic,'Value',0);
    set(handles.anaglyph,'Value',0);
else
    set(handles.anaglyph,'Enable','on')
    set(handles.sterostopic,'Enable','on');
    set(handles.enviar,'Enable','off');
end

function sterostopic_Callback(hObject, eventdata, handles)
if get(handles.sterostopic,'Value') == 1;
    set(handles.L_R,'Enable','off');
    set(handles.anaglyph,'Enable','off')
    set(handles.enviar,'Enable','on');
    set(handles.L_R,'Value',0);
    set(handles.anaglyph,'Value',0);
else
    set(handles.anaglyph,'Enable','on')
    set(handles.L_R,'Enable','on');
    set(handles.enviar,'Enable','off');
    
end

function anaglyph_Callback(hObject, eventdata, handles)

if get(handles.anaglyph,'Value') == 1;
    set(handles.L_R,'Enable','off');
    set(handles.enviar,'Enable','on');
    set(handles.L_R,'Value',0);
    set(handles.sterostopic,'Value',0);
else
    set(handles.sterostopic,'Enable','on');
    set(handles.L_R,'Enable','on');
    set(handles.enviar,'Enable','off');
end

function enviar_Callback(hObject, eventdata, handles)
global result result3D;

if get(handles.L_R,'Value') == 1;
    [izq,der] = cortar(result);
    msgbox('Imagen Derecha');
    uiwait
    guardarimg (der);
    msgbox('Imagen Izquierda');
    uiwait
    guardarimg (izq);
    
elseif get(handles.sterostopic,'Value') == 1;
    guardarimg (result);
    
else
    result3D = imaanaglifa(result);
    guardarimg (result3D);
    
end
close ();
