% housekeeping
clear all
close all
clc

% NXT parameters use by the Simulink model
encoder_counts=720;   % number of counts (if using quad encoding)
RPM_MAX = 170;        % spec sheet max RPM

% constants or conversion factors:
RADSEC2RPM = 60/(2*pi);       % radians/sec to RPM
RAD2C=encoder_counts/(2*pi);  % conversion from radians to counts
C2RAD=1/RAD2C; 
C2DEG=360/encoder_counts;
R2D=180/pi;
D2R=1/R2D;
g=9.8;

% Wheel Info
Rw=.02;    % radius of wheel in m (small wheel), under load

% Mathematica worksheet:  FinalProject_MinSegModel_Dual.nb
% This is the basic worksheet that originally balanced the single motor
% MinSeg, modified for the dual motor configuration.  It uses the measured
% motor parameters.
%KLQR=[5., 45.002, -70.9721, -12.5484];     % 21mm wheel .469kg Q=25 q[[2, 2]] = 25
%KLQR=[7.07107, 46.3558, -73.7155, -12.9532];     % 21mm wheel .469kg Q=50 q[[2, 2]] = 25
%KLQR=[8.3666, 47.5733, -82.8583, -15.8358];     % 21mm wheel .469kg Q=70
%KLQR=[8.94427, 47.871, -80.1239, -14.6206];     % 21mm wheel .469kg Q=80
%KLQR=[9.48683, 48.2975, -81.0327, -14.7501];     % 21mm wheel .469kg Q=90
%KLQR=[9.74679, 48.8103, -88.3807, -17.3460];     % 21mm wheel .469kg Q=95
%KLQR=[10.0000, 49.0476, -89.4253, -17.6302];     % 21mm wheel .469kg Q=100
%KLQR=[10.2470, 49.2818, -90.4527, -17.9093];     % 21mm wheel .469kg Q=105
%KLQR=[10.4881, 49.5133, -91.4639, -18.1836];     % 21mm wheel .469kg Q=110
%KLQR=[14.8324, 54.0895, -110.81, -23.3529];     % 21mm wheel .469kg Q=220
%KLQR=[22.3607, 63.3253, -147.766, -32.9177];     % 21mm wheel .469kg Q=500
%KLQR=[16.6624, 63.0922, -85.089, -18.5144];     % Experimental, pole placement.  Balanced on towell.
KLQR=[1.51643, 61.016, -99.6849, -24.9549];     % Experimental, pole placement {-2479.65, -3.04098 - 3.21584 I, -3.04098 + 3.21584 I, -0.0385901}.  Balances!!!!
%KLQR=[0.141565, 57.9806, -99.3035, -24.2514];     % 21mm wheel .469kg Q=220

% These lines are useful to check the signs of the gains
%KLQR=[00.0000, 00.0000, -95.5113, -00.0000];     % 21mm wheel .469kg Q=120
%KLQR=[00.0000, 00.0000, -00.0000, -28.6039];     % 21mm wheel .469kg Q=120

% Dual motors, but based on the analytics from the paper, ignoring
% position, and larger wheels
%KLQR=[1, 25.1926, -52.9779, -12.909];     % 40mm wheel .439kg Q=95

% Dual motors, but based on the analytics from the paper, ignoring
% position, angle, and larger wheels
%KLQR=[1, 21.4463, -30.4692, -5.33938];     % 40mm wheel .439kg Q=5
%KLQR=[1, 23.4750, -43.4858, -9.95103];     % 40mm wheel .439kg Q=50
%KLQR=[1, 25.1831, -52.0520, -12.9059];     % 40mm wheel .439kg Q=95
%KLQR=[1, 25.8767, -52.3232, -14.0135];     % 40mm wheel .439kg Q=115
%KLQR=[1, 28.5140, -67.2163, -17.9630];     % 40mm wheel .439kg Q=200

% Dual motors, but based on the analytics from the paper, ignoring position
%KLQR=[0.003, 41.4167, -74.3539, -14.7992];     % 21mm wheel .439kg Q=75
%KLQR=[0.003, 41.8746, -77.7647, -15.8885];     % 21mm wheel .439kg Q=95
%KLQR=[1, 42.7685, -81.696, -16.9987];     % 21mm wheel .439kg Q=105

% Dual motors, but based on the analytics from the paper
%KLQR=[8.66025, 45.1050, -80.3516, -15.6515];     % 21mm wheel .439kg Q=75
%KLQR=[9.21954, 45.6221, -82.6311, -16.2739];     % 21mm wheel .439kg Q=85
%KLQR=[9.74679, 46.1242, -84.8235, -16.8703];     % 21mm wheel .439kg Q=95

% combine some constants:
ES=-C2DEG*D2R;

% automatic calibration of gyro offset
% discrete 1st order filter recurrence relation - 
% discrete-time implementation of a low-pass filter is 
% the exponentially-weighted moving average
% alpha=.5 (time contant is equal to sampling period)
% alpha<.5 (time constant is larger than sampling period) tau ~ TS/alpha

% .006 requires 800 samples to get to steardy state (see gyro filter design)
% 1st order system take 3Tau to get to .95 ss value, 3.9Tau, 98, 4.56tau 99
% tau ~ .0025/.006 = .4167 = 3*.4167 = 1.25 to get to .95  - we need .99
% tau ~ .0025/.006 = .4167 = .4167*.456 = 1.9sec to get to 99% ss
a_go = .006;  % alpha for initial gyro offset calibration (2 sec for ss)

%% MPU5060
%TS=.005 % Minimum simulation time
TS=0.01; % Simulation time with motor controller
%TS=.005 % fastest with default mpu5060 library settings... and filter set to DLPF set to 4
% The gyro is really noisy at maximum rate so I set it a little lower to
% reduce the noise
GyroS=1000/32768;  % MPU5060 set to a rate of 1000 deg/second and 16-bit sampling
GS=GyroS*D2R;      % Convert from degrees to radians
tstart=1.2;
return


