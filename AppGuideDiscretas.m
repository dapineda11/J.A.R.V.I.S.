function varargout = AppGuideDiscretas(varargin)
% APPGUIDEDISCRETAS MATLAB code for AppGuideDiscretas.fig
%      APPGUIDEDISCRETAS, by itself, creates a new APPGUIDEDISCRETAS or raises the existing
%      singleton*.
%
%      H = APPGUIDEDISCRETAS returns the handle to a new APPGUIDEDISCRETAS or the handle to
%      the existing singleton*.
%
%      APPGUIDEDISCRETAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPGUIDEDISCRETAS.M with the given input arguments.
%
%      APPGUIDEDISCRETAS('Property','Value',...) creates a new APPGUIDEDISCRETAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AppGuideDiscretas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AppGuideDiscretas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AppGuideDiscretas

% Last Modified by GUIDE v2.5 22-Nov-2018 13:04:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AppGuideDiscretas_OpeningFcn, ...
                   'gui_OutputFcn',  @AppGuideDiscretas_OutputFcn, ...
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


% --- Executes just before AppGuideDiscretas is made visible.
function AppGuideDiscretas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AppGuideDiscretas (see VARARGIN)

% Choose default command line output for AppGuideDiscretas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AppGuideDiscretas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AppGuideDiscretas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function Imagen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Imagen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate Imagen




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonGrabar.
function pushbuttonGrabar_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonGrabar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
t = 3;
voz = audiorecorder(Fs, 16, 1);
recordblocking(voz, t);
y = getaudiodata(voz);
audiowrite ('comando1.wav',y,Fs);
 

% --- Executes on button press in pushbuttonReproducir.
function pushbuttonReproducir_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonReproducir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[voz,Fs]=audioread('test1.wav');
sound(voz,Fs);


% --- Executes on button press in pushbuttonDetectar.
function pushbuttonDetectar_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonDetectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[c,Fs] = audioread('comando1.wav');
[b,Fs] = audioread('comando2.wav');
[l,Fs] = audioread('comando3.wav');
[a,Fs] = audioread('comando4.wav');
[n,Fs] = audioread('comando5.wav');
%Tranformada de fourier y normalización
normc = c/norm(c) ;
cfft = abs(fft(normc));

normb = b/norm(b) ;
bfft = abs(fft(normb));

norml = l/norm(l) ;
lfft = abs(fft(norml));

norma = a/norm(a) ;
afft = abs(fft(norma));

normn = n/norm(n) ;
nfft = abs(fft(normn));

%Norma L2
comando1 =cfft/sqrt(sum(abs(cfft).^2));
comando2 =bfft/sqrt(sum(abs(bfft).^2));
comando3 =lfft/sqrt(sum(abs(lfft).^2));
comando4 =afft/sqrt(sum(abs(afft).^2));
comando5 =nfft/sqrt(sum(abs(nfft).^2));

%Tratamineto de la señal Grabada
[voz,Fs]=audioread('test1.wav');
norms = voz/norm(voz) ;
sfft = abs(fft(norms));
v=sfft/sqrt(sum(abs(sfft).^2));
%Comparación entre señal de entrada y diccionario
error(1)=mean(abs(comando1-v));
error(2)=mean(abs(comando2-v));
error(3)=mean(abs(comando3-v));
error(4)=mean(abs(comando4-v));
error(5)=mean(abs(comando5-v));

error_min=min(error);

if(error_min==error(1))
    set(handles.text4,'string','Comando es Uno');
end
if(error_min==error(2))
    set(handles.text4,'string','Comando es Convolucion Circular');
end
if(error_min==error(3))
    set(handles.text4,'string','Comando es Region de Convergencia');
end
if(error_min==error(4))
    set(handles.text4,'string','Comando es Abrir Ventana');
end
if(error_min==error(5))
    set(handles.text4,'string','Comando es Tocar el Piano');
end    

% --- Executes on button press in pushbuttonUno.
function pushbuttonUno_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonUno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[un,Fs] = audioread('comando1.wav');
sound(un,Fs);

% --- Executes on button press in pushbuttonCnvCircular.
function pushbuttonCnvCircular_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonCnvCircular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[dol,Fs] = audioread('comando2.wav');
sound(dol,Fs);



% --- Executes on button press in pushbuttonRegionConv.
function pushbuttonRegionConv_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonRegionConv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[tre,Fs] = audioread('comando3.wav');
sound(tre,Fs);


% --- Executes on button press in pushbuttonAbrirVdent.
function pushbuttonAbrirVdent_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonAbrirVdent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Vent,Fs] = audioread('comando4.wav');
sound(Vent,Fs);


% --- Executes on button press in pushbuttonTocarPiano.
function pushbuttonTocarPiano_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonTocarPiano (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Pian,Fs] = audioread('comando5.wav');
sound(Pian,Fs);



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text4 as text
%        str2double(get(hObject,'String')) returns contents of text4 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function text4_Callback(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text4 as text
%        str2double(get(hObject,'String')) returns contents of text4 as a double


% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
im=imread('CortanaP.jpg');
imshow(im)



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
%function Sgrabadas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sgrabadas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
%subplot(2,5,2),plot(v);
% Hint: place code in OpeningFcn to populate Sgrabadas




%function Sgrabada_Callback(hObject, eventdata, handles)
% hObject    handle to Sgrabada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Sgrabada as text
%        str2double(get(hObject,'String')) returns contents of Sgrabada as a double


% --- Executes during object creation, after setting all properties.
function Sgrabada_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sgrabada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonSgrabada.
function pushbuttonSgrabada_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSgrabada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
subplot(2,5,2),plot(v);


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
subplot(2,5,1),stem(voz);
 %Hint: place code in OpeningFcn to populate axes4
