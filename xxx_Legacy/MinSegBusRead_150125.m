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
NumSamples = 240;

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

cBuff(1) = fread(s,1,DataType);

iBuffStart = -1;
for k=2:NumSamples
    
    cBuff(k) = fread(s,1,DataType);
    
    % Construct the byte array, look for the beginning byte
    if( cBuff(k)==0 && cBuff(k-1)==0 && iBuffStart < 0)
        iBuffStart = k-1;
    else
        % Is this end mark?
        if( cBuff(k)==0 && cBuff(k-1)==0 && iBuffStart > 0  )
            
            % Is it long enough?
            if( k > (iBuffStart+6))
                iBuffEnd = k;

                % extract the frame
                cFrame = cBuff(iBuffStart:iBuffEnd)
                
                % check crc
                crc = hex2dec('FFFF');
                for i=1:length(cFrame)
                    
                    crc = MinSegBusCRC(crc, cFrame(i));
                
                end
                
                iBuffStart = -1;
            else
                iBuffStart = k-1;
                
            end
        end
    end
end

% Housekeeping
fclose(s);

cBuff