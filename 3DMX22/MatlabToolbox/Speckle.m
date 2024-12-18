function varargout = Speckle(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Speckle_OpeningFcn, ...
                   'gui_OutputFcn',  @Speckle_OutputFcn, ...
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
function Speckle_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global r6 result;
result = r6;
axes(handles.axes1);
    image(result);
    axis off  

function varargout = Speckle_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function Guardar_Callback(hObject, eventdata, handles)
Guardar
uiwait

function siguiente_Callback(hObject, eventdata, handles)
BlurF
close(gcbf);

function anterior_Callback(hObject, eventdata, handles)
Salt_Pepper
close(gcbf);