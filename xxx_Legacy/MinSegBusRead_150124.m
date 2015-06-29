% Reset the environment
clear all
clc

% search for all instrument objects:
close all

% Define the serial connection
COMport = 'Com3';
baudrate = 9600;

% Definitions for the MinSegBus frame structure
DataType = 'uint8';
NumSamples = 24;

% Update the screen
disp(['COMport: ' COMport ' DataType: ' DataType ' Number Samples:' num2str(NumSamples)]);
disp(' ');
disp(['-------------------- Opening ' COMport '  please wait up to 30 seconds ------------------'])
disp(' ');

%% Read from Serial:
s = serial(COMport);
set(s, 'ByteOrder', 'bigEndian');
set(s, 'BaudRate', baudrate); 
fopen(s);
d=fread(s, 1, DataType);


dat=[];
cBuff = zeros(NumSamples,1);

for k=1:NumSamples
    
    d = fread(s,1,DataType)
    cBuff(k) = d;
    
end

% Housekeeping
fclose(s);

cBuff