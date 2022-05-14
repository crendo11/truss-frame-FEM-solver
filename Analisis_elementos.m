function varargout = Analisis_elementos(varargin)
% ANALISIS_ELEMENTOS MATLAB code for Analisis_elementos.fig
%      ANALISIS_ELEMENTOS, by itself, creates a new ANALISIS_ELEMENTOS or raises the existing
%      singleton*.
%
%      H = ANALISIS_ELEMENTOS returns the handle to a new ANALISIS_ELEMENTOS or the handle to
%      the existing singleton*.
%
%      ANALISIS_ELEMENTOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANALISIS_ELEMENTOS.M with the given input arguments.
%
%      ANALISIS_ELEMENTOS('Property','Value',...) creates a new ANALISIS_ELEMENTOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Analisis_elementos_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Analisis_elementos_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Analisis_elementos

% Last Modified by GUIDE v2.5 05-May-2017 10:59:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Analisis_elementos_OpeningFcn, ...
                   'gui_OutputFcn',  @Analisis_elementos_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before Analisis_elementos is made visible.
function Analisis_elementos_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Analisis_elementos (see VARARGIN)

% Choose default command line output for Analisis_elementos
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Analisis_elementos wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Analisis_elementos_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


global E

for i=1:size(E,1)
    e = sprintf('Elemento %d',i);
    Elemento{i} = e;
end
set(handles.pop_elementos,'String',Elemento,'Value',1);


% --- Executes on selection change in pop_elementos.
function pop_elementos_Callback(hObject, eventdata, handles)
% hObject    handle to pop_elementos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% Hints: contents = cellstr(get(hObject,'String')) returns pop_elementos contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_elementos


% --- Executes during object creation, after setting all properties.
function pop_elementos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_elementos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in bot_glob.
function bot_glob_Callback(hObject, eventdata, handles)
% hObject    handle to bot_glob (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Fuerzas_elementos

%% Obtener el elemnto que se quiere analizar
Elemento_i = get(handles.pop_elementos,'Value');

%% Para facilitar la lectura de resultados
e = sprintf('Forces in Global Coordinates for Element %d',Elemento_i);

%% Se asignan los datos a las tablas y se activa la visibilidad
set(handles.c_globales,'data',Fuerzas_elementos{Elemento_i})
set(handles.txt_glob,'visible','on')
set(handles.txt_glob,'String',e)
set(handles.c_globales,'visible','on')

% --- Executes on button press in bot_local.
function bot_local_Callback(hObject, eventdata, handles)
% hObject    handle to bot_local (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Fuerzas_L


Elemento_i = get(handles.pop_elementos,'Value');

e = sprintf('Forces in Local Coordinates for Element %d',Elemento_i);

%% Aqui se elimina la primera columna
Fuerza = Fuerzas_L{Elemento_i};
 
set(handles.c_locales,'data',Fuerza(:,2:4))
set(handles.txt_local,'visible','on')
set(handles.txt_local,'String',e)
set(handles.c_locales,'visible','on')

% --- Executes on button press in bot_esfuerzos.
function bot_esfuerzos_Callback(hObject, eventdata, handles)
% hObject    handle to bot_esfuerzos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global esfuerzo

Elemento_i = get(handles.pop_elementos,'Value');

e = sprintf('Esfuerzos del elemento %d',Elemento_i);

set(handles.c_esfuerzo,'data',esfuerzo(Elemento_i,:))
set(handles.txt_esfuer,'visible','on')
set(handles.txt_esfuer,'String',e)
set(handles.c_esfuerzo,'visible','on')


% --- Executes on button press in bot_diagramas.
function bot_diagramas_Callback(hObject, eventdata, handles)
% hObject    handle to bot_diagramas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global L
global Fuerzas_L

Elemento_i = get(handles.pop_elementos,'Value');

graficar_diagramas(Fuerzas_L{Elemento_i},L(Elemento_i),Elemento_i)
