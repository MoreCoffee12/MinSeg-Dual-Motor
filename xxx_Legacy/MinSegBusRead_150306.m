% Reset the environment
clear all
close all
clc

% Working offline, in debug mode?
Online = true;

% Define the connection
isBluetooth = true;
BluetoothName = 'HC-05 115200 MS';
COMport = 'Com3';
baudrate = 115200;

% Uncomment these lines to list attached bluetooth devices
%b = instrhwinfo('Bluetooth')
%b.RemoteNames

% Definitions for the MinSegBus frame structure
DataType = 'uint8';
iPreLoad = 48;

% Update the screen
%% Read from Serial:
if Online
    NumSamples = 65536;
    if( isBluetooth )
        disp(['Bluetooth name: ' BluetoothName ' DataType: ' DataType ' Number Samples:' num2str(NumSamples) ' Baud: ' num2str(baudrate)]);
        disp(' ');
        disp(['-------------------- Opening ' BluetoothName '  please wait up to 30 seconds ------------------'])
        disp(' ');
        s = Bluetooth(BluetoothName,1);
    else
        disp(['COMport: ' COMport ' DataType: ' DataType ' Number Samples:' num2str(NumSamples) ' Baud: ' num2str(baudrate)]);
        disp(' ');
        disp(['-------------------- Opening ' COMport '  please wait up to 30 seconds ------------------'])
        disp(' ');
        s = serial(COMport);
        set(s, 'BaudRate', baudrate); 
    end
    set(s, 'ByteOrder', 'bigEndian');
    fopen(s);
    d=fread(s, 1, DataType);
    cBuff = zeros(NumSamples,1);

    disp('Beginnng data acquisition...');
    for k=iPreLoad+1:NumSamples

        % Read in the next byte
        if Online
            cBuff(k) = fread(s,1,DataType);
        end
    end
    disp('End data acquisition...');
    
    
    strPlotTitle ='-| On-line |-';
else
    strPlotTitle ='DataSet19_TuningComplete_GyroBW256_Q110_Q33_100_FS_100_Hand.mat';
    %strPlotTitle ='DataSet20_TuningComplete_GyroBW256_Q110_Q33_100_FS_100_Hardsurface.mat';
    load(strPlotTitle);
end

% retrieve number of samples
NumSamples = length(cBuff);

% Read in at least the first key pieces of information about the frame
for idx = 1:iPreLoad
    if Online
        cBuff(idx) = fread(s,1,DataType);
    end
end

iBuffStart = -1;
iBuffEnd = -1;
idxData = 1;
idxChannel = 1;
iBuffData = zeros(8,NumSamples);
disp('Beginnng data processing...');
for k=iPreLoad+1:NumSamples
    
    % Construct the byte array, look for the beginning byte
    if( cBuff(k-iPreLoad)==0 && cBuff(k-iPreLoad+1)==0 && iBuffStart < 0)
        
        % This could be the start of a frame or it could just be a zero
        % value passed in.  The following sequence checks that it is a
        % valid data frame.
        iFrameSize = cBuff(k-iPreLoad+2);
        
        % The frame size is bounded to 256 bytes and must be at last 11
        if( iFrameSize < 255 && iFrameSize > 11 && k < NumSamples-iFrameSize)

            % Check that the terminating zeros are present
            if(cBuff(k-iPreLoad+iFrameSize) == 0 && cBuff(k-iPreLoad+iFrameSize-1) == 0)

                iBuffStart = k-iPreLoad;
                iBuffEnd = iBuffStart+iFrameSize-1;

                % extract the possible frame including the end mark zeros
                cFrame = cBuff(iBuffStart:iBuffEnd);

                % check crc
                crc = hex2dec('FFFF');
                for i=1:(iFrameSize-4)
                    crc = MinSegBusCRC(crc, cFrame(i));
                end
                
                % compare with the recorded crc
                iStoredCRC = typecast([ uint8(cFrame(end-3)) uint8(cFrame(end-2))],'uint16');
                if( crc == iStoredCRC )

                    % what kind of data is this?
                    iType = cFrame(5);
                    
                    % it made it this far, must be a good value
                    switch iType
                        
                        % 32-bit floating point
                        case 0
                            idxChannel = 1;
                            for idxFrame = 0:4:(iFrameSize-9-1)
                                iBuffData(idxChannel,idxData) = typecast([ uint8(cFrame(idxFrame+6)) uint8(cFrame(idxFrame+7)) uint8(cFrame(idxFrame+8)) uint8(cFrame(idxFrame+9))],'single');
                                idxChannel = idxChannel+1;
                            end
                            idxData = idxData+1;

                        % Integer
                        case 1
                            idxChannel = 1;
                            for idxFrame = 0:2:(iFrameSize-9-1)
                                iBuffData(idxChannel,idxData) = typecast([ uint8(cFrame(idxFrame+6)) uint8(cFrame(idxFrame+7))],'uint16');
                                idxChannel = idxChannel+1;
                            end
                            idxData = idxData+1;
                    end
                else
                    
                    %disp('Failed crc check');
                    % Just here to debug if needed
                    if Online
                        %keyboard
                        %fclose(s);
                    end
                    
                end
                
                % reset the buffer pointer
                iBuffStart = -1;

            end
            
        end
        
    end
end

% Housekeeping
if Online
    fclose(s);
end

disp('End data processing...');


%% Plot
iBuffData = iBuffData(:,1:idxData-1);
subplot(4,1,1)
plot(iBuffData(1,:))
title('Position')
hold on
subplot(4,1,2)
plot(iBuffData(2,:))
title('Velocity')
subplot(4,1,3)
dPitchAngle = iBuffData(3,:);
plot(dPitchAngle)
title('Pitch Angle')
%ylim([-0.1 0.1])
subplot(4,1,4)
plot(iBuffData(4,:))
title('Average Pitch Angle Rate')

%% FFT of the pitch angle
fs = 100;
N = length(iBuffData(3,:));
figure
Y=fft(iBuffData(3,:))./N;
Y=fftshift(Y);
ws=specscale(N,fs);

title({strPlotTitle 'Pitch Angle Spectrum'},'Interpreter','None')
hold on
plot(ws,abs(Y),'k','LineWidth',1.0);
grid on
xlabel('Frequency, Hz')
ylabel('Amplitude, dB')
ylabel('Pitch angle, radians')
xlim([0 50])


%% Control effort goodness
figure
dControlEffort = iBuffData(5,:);
plot(dControlEffort)
title('Control Effort')

%% FFT of the controller effort
fs = 100;
N = length(dControlEffort);
figure
Y=fft(dControlEffort)./N;
Y=fftshift(Y);
ws=specscale(N,fs);

title({strPlotTitle 'Control Effort Spectrum'},'Interpreter','None')
hold on
plot(ws,abs(Y),'k','LineWidth',1.0);
grid on
xlabel('Frequency, Hz')
ylabel('Amplitude, dB')
ylabel('Controller effort, volts')
xlim([0 50])

%% Gyro analysis
figure
subplot(4,1,1)
plot(-iBuffData(4,:))
%ylim([-1 1])
title('Average Pitch Angle Rate')
subplot(4,1,2)
plot(iBuffData(6,:))
%ylim([-1 1])
title('Upper Pitch Angle Rate')
subplot(4,1,3)
plot(iBuffData(7,:))
%ylim([-1 1])
title('Lower Pitch Angle Rate')
subplot(4,1,4)
%ylim([-1 1])
dGyroDiff = iBuffData(7,:)-iBuffData(6,:);
plot(dGyroDiff)
title('Difference of Lower and Upper Pitch Angle Rate')

%% FFT of the difference between the gyros
fs = 100;
N = length(dGyroDiff);
figure
Y=fft(dGyroDiff)./N;
Y=fftshift(Y);
ws=specscale(N,fs);

title({strPlotTitle 'Gyro Difference Spectrum'},'Interpreter','None')
hold on
plot(ws,abs(Y),'k','LineWidth',1.0);
grid on
xlabel('Frequency, Hz')
ylabel('Amplitude, dB')
ylabel('Difference in pitch rate, rad/s')
xlim([0 50])
