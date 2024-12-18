function varargout = Salt_Pepper(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Salt_Pepper_OpeningFcn, ...
                   'gui_OutputFcn',  @Salt_Pepper_OutputFcn, ...
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
function Salt_Pepper_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global r5 result;
result = r5;
axes(handles.axes1);
    image(result);
    axis off   
function varargout = Salt_Pepper_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function Guardar_Callback(hObject, eventdata, handles)
Guardar
uiwait

function siguiente_Callback(hObject, eventdata, handles)
Speckle
close(gcbf);

function anterior_Callback(hObject, eventdata, handles)
Spatial_correlation
close(gcbf);
