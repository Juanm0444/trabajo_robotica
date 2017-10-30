function varargout = GUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

global connected
connected = 0;


function varargout = GUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;
disconnect(handles);
instrreset;

% Se activa cuando se presiona el botón Conectar/Desconectar
function conectar_Callback(hObject, eventdata, handles)

global connected
if connected == 0
    connect(handles);
else
    disconnect(handles);
end

% conect es el puerto de Arduino
function conect_Callback(hObject, eventdata, handles)
function conect_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
ope = 5;
c1 = str2num(get(handles.editc1, 'String'));
c2 = str2num(get(handles.editc2, 'String'));
c3 = str2num(get(handles.editc3, 'String'));
velocidad = str2num(get(handles.vcons, 'String'));
send_message2(ope, c1, c2, c3, velocidad);

% Se activa cuando se presiona el botón Motor 1
function motor1_Callback(hObject, eventdata, handles)

ope = 1;
angulo = str2num(get(handles.editmot1, 'String'));
velocidad = str2num(get(handles.vcons, 'String'));
send_message1(ope, angulo, velocidad);


% Se activa cuando se presiona el botón Motor 2
function motor2_Callback(hObject, eventdata, handles)

ope = 2;
angulo = str2num(get(handles.editmot2, 'String'));
velocidad = str2num(get(handles.vcons, 'String'));
send_message1(ope, angulo, velocidad);

% Se activa cuando se presiona el botón Motor 3
function motor3_Callback(hObject, eventdata, handles)

ope = 3;
angulo = str2num(get(handles.editmot3, 'String'));
velocidad = str2num(get(handles.vcons, 'String'));
send_message1(ope, angulo, velocidad);

% --- Executes on button press in arrancar.
function arrancar_Callback(hObject, eventdata, handles)
ope = 4;
c1 = str2num(get(handles.editc1, 'String'));
c2 = str2num(get(handles.editc2, 'String'));
c3 = str2num(get(handles.editc3, 'String'));
velocidad = str2num(get(handles.vcons, 'String'));
send_message2(ope, c1, c2, c3, velocidad);


% -- DEFINICIÓN DE LOS EDIT DE LOS MOTORES
%-------------------------------------------------------------
function editmot1_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function editmot1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editmot2_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function editmot2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editmot3_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function editmot3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%-------------------------------------------------------


% DEFINICIÓN DE LA VELOCIDAD
%-----------------------------------------------------
% velocidad variable
function vel_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function vel_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


%velocidad constante
function vcons_Callback(hObject, eventdata, handles)

% Hints: get(hObject,'String') returns contents of vcons as text
%        str2double(get(hObject,'String')) returns contents of vcons as a double


% --- Executes during object creation, after setting all properties.
function vcons_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%------------------------------------------------------------------



% DEFINICIÓN DE LOS EDIT DE COORDENADAS
function c1_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function c1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c2_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function c2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c3_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function c3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editc3_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function editc3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editc2_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function editc2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editc1_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function editc1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%----------------------------------------------




% EMPIEZAN LAS FUNCIONES DE COMUNICACIÓN

function connect(handles)
global connected
global arduino
%try
    if isempty(get(handles.conect,'String'))==0
        port = get(handles.conect, 'string');
        if iscell(port)==1
            port=port{1};
        end
        arduino = serial (port);
        fopen (arduino);
        connected=1;
        if connected==1
            set(handles.conect,'BackgroundColor','green');
            disp('Connected');
            %fscanf (arduino, angulo);
            %disp('Posición:');
            %disp(angulo);
        end
    end


function disconnect(handles)
global arduino
global connected
if connected == 1
    try
        fclose(arduino);
        disp('Disconnected');
        set(handles.conect,'BackgroundColor','red');
        connected=0;
    catch
        disp('Not disconnected');
        connected=1;
    end
end

%Manda el mensaje a arduino cuando se mueve un solo motor
function send_message1(ope, data1, data2)
global connected
global arduino
% Envia un mensaje en el puerto serie:
if connected==1 
    ope = round(ope);
    data1 = round(data1);
    data2 = round(data2);
    msg = strcat('#',num2str(ope),'#',num2str(data1),'#', num2str(data2),'#');
    fprintf (arduino, msg);
    disp('MSG Sent');
    disp(msg);
else 
    disp('Please connect');
end

%Manda el mensaje a arduino cuando se introducen coordenadas y entonces se
%mueven los tres motores
function send_message2(ope, data1, data2, data3, data4)
global connected
global arduino
% Envia un mensaje en el puerto serie:
if connected==1 
    if ope == 4
    data1 = round(data1);
    data2 = round(data2);
    data3 = round(data3);
    data4 = round(data4);
    msg = strcat('#',num2str(ope),'#',num2str(data1),'#', num2str(data2),'#', num2str(data3),'#', num2str(data4),'#');
    fprintf (arduino, msg);
    disp('MSG Sent');
    disp(msg);
    end
    
    if ope ==5
    data1 = 0;
    data2 = 0;
    data3 = 0;
    data4 = round(data4);
    msg = strcat('#',num2str(4),'#',num2str(data1),'#', num2str(data2),'#', num2str(data3),'#', num2str(data4),'#');
    fprintf (arduino, msg);
    disp('MSG Sent');
    disp(msg);
    end
else 
    disp('Please connect');
end

function receive_message(handles)
global connected
global arduino
% Recibe un mensaje en el puerto serie:
if connected==1 
    msg = fscanf (arduino, '%s')
    msg_split = strsplit(msg, '#');

end



