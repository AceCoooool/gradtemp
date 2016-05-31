function varargout = GUIqubingyaogan(varargin)
% GUIQUBINGYAOGAN MATLAB code for GUIqubingyaogan.fig
%      GUIQUBINGYAOGAN, by itself, creates a new GUIQUBINGYAOGAN or raises the existing
%      singleton*.
%
%      H = GUIQUBINGYAOGAN returns the handle to a new GUIQUBINGYAOGAN or the handle to
%      the existing singleton*.
%
%      GUIQUBINGYAOGAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIQUBINGYAOGAN.M with the given input arguments.
%
%      GUIQUBINGYAOGAN('Property','Value',...) creates a new GUIQUBINGYAOGAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIqubingyaogan_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIqubingyaogan_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIqubingyaogan

% Last Modified by GUIDE v2.5 09-May-2016 20:38:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIqubingyaogan_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIqubingyaogan_OutputFcn, ...
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


% --- Executes just before GUIqubingyaogan is made visible.
function GUIqubingyaogan_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIqubingyaogan (see VARARGIN)

% Choose default command line output for GUIqubingyaogan
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIqubingyaogan wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIqubingyaogan_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function l1_Callback(hObject, eventdata, handles)
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l1 as text
%        str2double(get(hObject,'String')) returns contents of l1 as a double


% --- Executes during object creation, after setting all properties.
function l1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l2_Callback(hObject, eventdata, handles)
% hObject    handle to l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l2 as text
%        str2double(get(hObject,'String')) returns contents of l2 as a double


% --- Executes during object creation, after setting all properties.
function l2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e_Callback(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e as text
%        str2double(get(hObject,'String')) returns contents of e as a double


% --- Executes during object creation, after setting all properties.
function e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global L1 L2 E theta0 theta flag;
L1=str2double(get(handles.l1,'string'));
L2=str2double(get(handles.l2,'string'));
E=str2double(get(handles.e,'string'));
if strcmp(get(handles.thetabutton,'Enable'),'off')==1
    theta0=0;theta=0;flag=0;
else
    flag=1;
end
if isnan(L1)&&isnan(L2)&&isnan(E)
    errordlg('请在文本框输入数据','输入错误');
end
if (L1<0)||(L2<0)||(E<0)||(L2-L1<E)
    errordlg('尺寸设置不合理','输入错误');
end
[thetas,thetal]=limitSituation(L1,L2,E);
s=sprintf('%s%f\n%s%f\n','极限角度1: ',rad2deg(thetas),'极限角度2: ',rad2deg(thetal));
set(handles.tishi,'string',s);


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
v=get(handles.checkbox1,'Value');
if v==0
    set(handles.edit4,'Enable','off');
    set(handles.edit5,'Enable','off');
    set(handles.thetabutton,'Enable','off');
else
    set(handles.edit4,'Enable','on');
    set(handles.edit5,'Enable','on');
    set(handles.thetabutton,'Enable','on');
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

% --- Executes on button press in huitu.
function huitu_Callback(hObject, eventdata, handles)
% hObject    handle to huitu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global L1 L2 E theta0 theta flag;
axes(handles.axes1)
cla reset;
[dmin,dmax]=plotdh(L1,L2,E,theta0,theta,flag);
s=sprintf('%s%f\n%s%f\n','最近距离: ',dmin,'最远距离: ',dmax);
set(handles.text8,'string',s);


% --- Executes on button press in thetabutton.
function thetabutton_Callback(hObject, eventdata, handles)
% hObject    handle to thetabutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global theta0 theta flag; 
theta0=deg2rad(str2double(get(handles.edit4,'string')));
theta=deg2rad(str2double(get(handles.edit5,'string')));
flag=1;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ting;
ting=1;
