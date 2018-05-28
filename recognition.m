function varargout = recognition(varargin)
% RECOGNITION MATLAB code for recognition.fig
%      RECOGNITION, by itself, creates a new RECOGNITION or raises the existing
%      singleton*.
%
%      H = RECOGNITION returns the handle to a new RECOGNITION or the handle to
%      the existing singleton*.
%
%      RECOGNITION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECOGNITION.M with the given input arguments.
%
%      RECOGNITION('Property','Value',...) creates a new RECOGNITION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before recognition_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to recognition_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help recognition

% Last Modified by GUIDE v2.5 27-May-2018 11:22:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @recognition_OpeningFcn, ...
                   'gui_OutputFcn',  @recognition_OutputFcn, ...
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


% --- Executes just before recognition is made visible.
function recognition_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to recognition (see VARARGIN)

% Choose default command line output for recognition
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes recognition wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = recognition_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
    global coss
    %  函数生成
    csi_trace = read_bf_file('data/test/csi_a10_1.dat');
    m = size(csi_trace, 1);  % 得出一个dat文件的包的数量
    dataSet = zeros(m, 3) ;  % 创建 一个可以容纳 包数量的矩阵                
    coss = [];

    for k=1:200
        t = get_scaled_csi(csi_trace{k}) ;                              
        t = db(abs(squeeze(t).')) ;
        dataSet(k,:) = mean(t) ;  %  解决上述问题：  对30个数据取了平均值
        coss = [coss;mean(t)];
    end
    

function flitered_data = time_flitering(dataSet)
%   flitering dataSet use time histroical factor
%   input : dataSet - m*3 matrix for data
%   output : flitered_data - dataSet flierted
%   -----------------------------------------------------------------------
    w = 100 ; % histroical param
    m = size(dataSet, 1) ;
    t = dataSet ;
    for type = 1:3
        for p=w:m
            sum_mol = 0 ; % Molecular
            sum_den = 0 ; % Denominator
            for q=w:-1:1
                sum_mol = sum_mol + q*dataSet(p-(w-q),type) ;
                sum_den = sum_den + q ;
            end
            t(p,type) = sum_mol/sum_den ;
        end
    end
    flitered_data = t ;


% --- Executes during object creation, after setting all properties.
function axes42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text33.
function text33_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global coss
plot(handles.axes42,coss(1:30));
plot(handles.axes41,coss(30:60));
plot(handles.axes39,coss(60:90));
plot(handles.axes50,coss(90:120));
plot(handles.axes40,coss(120:150));

hold on ;
plot(handles.axes51,coss);
hold off ;

coss = time_flitering(coss);
hold on ;
plot(handles.axes52,coss);
hold off ;

cossc = coss == -Inf;
coss(cossc) = 0;
[coeff,score,latent] = pca(coss);
plot(handles.axes53,score)

bar(handles.axes54,[3,1,5,4,6]);
% 
my_coss1 = get_coss('data/test/1.0-0-2.dat');
my_coss2 = get_coss('data/test/1.0-0-3.dat');
my_coss3 = get_coss('data/test/1.0-15-4.dat');
my_coss4 = get_coss('data/test/1.0-15-1.dat');
my_coss5 = get_coss('data/test/1.0-15-2.dat');
%
plot(handles.axes56,my_coss1(1:30));
plot(handles.axes48,my_coss2(1:30));
plot(handles.axes57,my_coss3(1:30));
plot(handles.axes45,my_coss4(1:30));
plot(handles.axes43,my_coss5(1:30));
% 1
my_coss1 = time_flitering(my_coss1);
cossc = my_coss1 == -Inf;
my_coss1(cossc) = 0;
[coeff,score,latent] = pca(my_coss1);
plot(handles.axes55,score)
% 2
my_coss2 = time_flitering(my_coss2);
cossc = my_coss2 == -Inf;
my_coss2(cossc) = 0;
[coeff,score,latent] = pca(my_coss2);
plot(handles.axes49,score)
% 3
my_coss3 = time_flitering(my_coss3);
cossc = my_coss3 == -Inf;
my_coss3(cossc) = 0;
[coeff,score,latent] = pca(my_coss3);
plot(handles.axes47,score)
% 4
my_coss4 = time_flitering(my_coss4);
cossc = my_coss4 == -Inf;
my_coss4(cossc) = 0;
[coeff,score,latent] = pca(my_coss4);
plot(handles.axes46,score)
% 5
%my_coss5 = time_flitering(my_coss5);
cossc = my_coss5 == -Inf;
my_coss5(cossc) = 0;
[coeff,score,latent] = pca(my_coss5);
plot(handles.axes44,score);

%%%%%%%%%%%%%
set(handles.edit15,'Visible','On')
set(handles.edit14,'Visible','On')
set(handles.edit13,'Visible','On')
set(handles.edit12,'Visible','On')
set(handles.edit11,'Visible','On')
