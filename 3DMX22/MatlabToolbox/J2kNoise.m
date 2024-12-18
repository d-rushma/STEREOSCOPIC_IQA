function varargout = J2kNoise(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @J2kNoise_OpeningFcn, ...
                   'gui_OutputFcn',  @J2kNoise_OutputFcn, ...
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
function J2kNoise_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global r10 result;
result = r10;
axes(handles.axes1);
    image(result);
    axis off 
function varargout = J2kNoise_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function Guardar_Callback(hObject, eventdata, handles)
Guardar
uiwait

function siguiente_Callback(hObject, eventdata, handles)
close();

function anterior_Callback(hObject, eventdata, handles)
JpgNoise
close(gcbf);
