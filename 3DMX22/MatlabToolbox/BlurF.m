function varargout = BlurF(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BlurF_OpeningFcn, ...
                   'gui_OutputFcn',  @BlurF_OutputFcn, ...
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
function BlurF_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global r7 result;
result = r7;
axes(handles.axes1);
    image(result);
    axis off  
function varargout = BlurF_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function Guardar_Callback(hObject, eventdata, handles)
Guardar
uiwait

function siguiente_Callback(hObject, eventdata, handles)
ContrastF
close(gcbf);

function anterior_Callback(hObject, eventdata, handles)
Speckle
close(gcbf);
