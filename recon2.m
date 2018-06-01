function varargout = recon2(varargin)
% RECON2 MATLAB code for recon2.fig
%      RECON2, by itself, creates a new RECON2 or raises the existing
%      singleton*.
%
%      H = RECON2 returns the handle to a new RECON2 or the handle to
%      the existing singleton*.
%
%      RECON2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECON2.M with the given input arguments.
%
%      RECON2('Property','Value',...) creates a new RECON2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before recon2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to recon2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help recon2

% Last Modified by GUIDE v2.5 02-Jun-2018 07:30:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @recon2_OpeningFcn, ...
                   'gui_OutputFcn',  @recon2_OutputFcn, ...
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


% --- Executes just before recon2 is made visible.
function recon2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to recon2 (see VARARGIN)

% Choose default command line output for recon2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes recon2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = recon2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global coss
plot(handles.axes4,coss(1:30));
plot(handles.axes3,coss(30:60));
plot(handles.axes1,coss(60:90));
plot(handles.axes12,coss(90:120));
plot(handles.axes2,coss(120:150));

hold on ;
plot(handles.axes13,coss);
hold off ;

coss = time_flitering(coss);
hold on ;
plot(handles.axes14,coss);
hold off ;

cossc = coss == -Inf;
coss(cossc) = 0;
[coeff,score,latent] = pca(coss);
plot(handles.axes15,score)

bar(handles.axes16,[3,1,5,4,6]);
% 
my_coss1 = get_coss('data/test/3.5-30-1.dat');
my_coss2 = get_coss('data/test/3.5-30-2.dat');
my_coss3 = get_coss('data/test/3.5-30-3.dat');
my_coss4 = get_coss('data/test/3.5-30-4.dat');
my_coss5 = get_coss('data/test/3.5-30-5.dat');
%
plot(handles.axes18,my_coss1(1:30));
plot(handles.axes10,my_coss2(1:30));
plot(handles.axes19,my_coss3(1:30));
plot(handles.axes7,my_coss4(1:30));
plot(handles.axes5,my_coss5(1:30));
% 1
my_coss1 = time_flitering(my_coss1);
cossc = my_coss1 == -Inf;
my_coss1(cossc) = 0;
[coeff,score,latent] = pca(my_coss1);
plot(handles.axes17,score)
% 2
my_coss2 = time_flitering(my_coss2);
cossc = my_coss2 == -Inf;
my_coss2(cossc) = 0;
[coeff,score,latent] = pca(my_coss2);
plot(handles.axes11,score)
% 3
my_coss3 = time_flitering(my_coss3);
cossc = my_coss3 == -Inf;
my_coss3(cossc) = 0;
[coeff,score,latent] = pca(my_coss3);
plot(handles.axes9,score)
% 4
my_coss4 = time_flitering(my_coss4);
cossc = my_coss4 == -Inf;
my_coss4(cossc) = 0;
[coeff,score,latent] = pca(my_coss4);
plot(handles.axes8,score)
% 5
%my_coss5 = time_flitering(my_coss5);
cossc = my_coss5 == -Inf;
my_coss5(cossc) = 0;
[coeff,score,latent] = pca(my_coss5);
plot(handles.axes6,score);

%%%%%%%%%%%%%
set(handles.edit5,'Visible','On')
set(handles.edit4,'Visible','On')
set(handles.edit3,'Visible','On')
set(handles.edit2,'Visible','On')
set(handles.edit1,'Visible','On')



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global coss
    %  函数生成
    csi_trace = read_bf_file('data/test/still_1.dat');
    m = size(csi_trace, 1);  % 得出一个dat文件的包的数量
    dataSet = zeros(m, 3) ;  % 创建 一个可以容纳 包数量的矩阵                
    coss = [];

    for k=1:50
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
