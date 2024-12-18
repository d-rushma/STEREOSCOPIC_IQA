function varargout = Localva(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Localva_OpeningFcn, ...
                   'gui_OutputFcn',  @Localva_OutputFcn, ...
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
%Muestra imagen resultado--------------------------------------------------
function Localva_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global r3 result;
result = r3;
axes(handles.axes1);
    image(result);
    axis off
function varargout = Localva_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function Guardar_Callback(hObject, eventdata, handles)
Guardar
uiwait

function siguiente_Callback(hObject, eventdata, handles)
Spatial_correlation
close(gcbf);

function anterior_Callback(hObject, eventdata, handles)
Impuls
close(gcbf);
