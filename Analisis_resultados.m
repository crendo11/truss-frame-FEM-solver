function varargout = Analisis_resultados(varargin)
% ANALISIS_RESULTADOS MATLAB code for Analisis_resultados.fig
%      ANALISIS_RESULTADOS, by itself, creates a new ANALISIS_RESULTADOS or raises the existing
%      singleton*.
%
%      H = ANALISIS_RESULTADOS returns the handle to a new ANALISIS_RESULTADOS or the handle to
%      the existing singleton*.
%
%      ANALISIS_RESULTADOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANALISIS_RESULTADOS.M with the given input arguments.
%
%      ANALISIS_RESULTADOS('Property','Value',...) creates a new ANALISIS_RESULTADOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Analisis_resultados_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Analisis_resultados_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Analisis_resultados

% Last Modified by GUIDE v2.5 23-May-2017 14:34:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Analisis_resultados_OpeningFcn, ...
                   'gui_OutputFcn',  @Analisis_resultados_OutputFcn, ...
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


% --- Executes just before Analisis_resultados is made visible.
function Analisis_resultados_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Analisis_resultados (see VARARGIN)

% Choose default command line output for Analisis_resultados
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Analisis_resultados wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Analisis_resultados_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in bot_unodales.
function bot_unodales_Callback(hObject, eventdata, handles)
% hObject    handle to bot_unodales (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Des


set(handles.c_desp,'data',Des)
set(handles.txt_u,'visible','on')
set(handles.c_desp,'visible','on')


% --- Executes on button press in bot_fuer.
function bot_fuer_Callback(hObject, eventdata, handles)
% hObject    handle to bot_fuer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Fuer
set(handles.c_fuer,'data',Fuer)
set(handles.txt_f,'visible','on')
set(handles.c_fuer,'visible','on')

% --- Executes on button press in bot_elementos.
function bot_elementos_Callback(hObject, eventdata, handles)
% hObject    handle to bot_elementos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Analisis_elementos

% --- Executes on button press in bot_graf.
function bot_graf_Callback(hObject, eventdata, handles)
% hObject    handle to bot_graf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global N
global E
global Des
global L
global ang
global tipo_estructura
global CERCHA
global PORTICO

%% Se lee el factor de multiplicacion de los desplazamientos
Fescalar = str2double(get(handles.etxt_factor,'String'));

%% Se  analiza que no se haya ingresado un numero
if isfinite(Fescalar)
    figure
    plot_sys(N,E,'-ob')
    switch tipo_estructura
        case CERCHA
            plot_sys_defor(Des,E,N,Fescalar,'.-r')
        case PORTICO
            graficar_sistema(N,E,L,ang,Fescalar,Des)
    end
else
    msgbox('Debe ingresar un factor de multiplicacion','Error al graficar')
end

function etxt_factor_Callback(hObject, eventdata, handles)
% hObject    handle to etxt_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etxt_factor as text
%        str2double(get(hObject,'String')) returns contents of etxt_factor as a double


% --- Executes during object creation, after setting all properties.
function etxt_factor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etxt_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in B_animar.
function B_animar_Callback(hObject, eventdata, handles)
% hObject    handle to B_animar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global N
global E
global Des
global L
global ang
global tipo_estructura
global CERCHA
global PORTICO

%% Se lee el factor de multiplicacion de los desplazamientos
Fescalar = str2double(get(handles.etxt_factor,'String'));

%% Se  analiza que no se haya ingresado un numero
if isfinite(Fescalar)
    j = 1;
    
    %% Delta del Faescalar
    paso = str2double(inputdlg('Enter a step for the scalar factor: ','Delta'));
    
    if isfinite(paso)
        for i = 1:paso:Fescalar
            h = figure;
            plot_sys(N,E,'-ob')
            switch tipo_estructura
                case PORTICO
                    graficar_sistema(N,E,L,ang,i,Des)
                case CERCHA
                    plot_sys_defor(Des,E,N,i,'.-r')
            end
            A(j) = getframe;
            close(h)
            j = j+1;
        end
        figure
        movie(A,-30,30)
    else
        msgbox('Debe ingresar un paso para el factor de multiplicacion','Error al graficar')
    end
else
    msgbox('Debe ingresar un factor de multiplicacion','Error al graficar')
end
