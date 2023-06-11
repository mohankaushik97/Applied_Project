% Load acceleration data
close all;
clear;
clc;
%% importing data from excel
clear all;
close all;
clc;

% Specify the path to the Excel file and sheet name
filename = 'emgAndAcc.xlsx';
sheet = 'Sheet1';

% Read the data from the Excel sheet into a table
data = readtable(filename, 'Sheet', sheet);

% Extract the desired columns as column matrices for 'emg.mat'
Xs = data.Xs;
emg = data.emg;
emg_rms = data.emg_rms;
save('emg.mat', 'Xs', 'emg', 'emg_rms');

% Extract the desired columns as column matrices for 'acc.mat'
Xs_acc = data.Xs_acc;
AccX = data.AccX;
AccY = data.AccY;
AccZ = data.AccZ;

filename = 'gazeAnalysis.xlsx';
sheet = 'Data';

data = readtable(filename, 'Sheet', sheet);

Xs_gaze = data.Xs;
gazeX = data.GazeX;
gazeY = data.GazeY;

nonzero_rows = any([AccX, AccY, AccZ], 2);
Xs_acc = Xs_acc(nonzero_rows);
AccX = AccX(nonzero_rows);
AccY = AccY(nonzero_rows);
AccZ = AccZ(nonzero_rows);

% Save the updated column matrices to 'acc.mat'
save('acc.mat', 'Xs_acc', 'AccX', 'AccY', 'AccZ');
%% Getting Acc Data
load('acc.mat');

% Calculate the magnitude of the acceleration vector
AccX = AccX(100:end-1500);
AccY = AccY(100:end-1500);
AccZ = AccZ(100:end-1500);
Xs_acc = Xs_acc(100:end-1500);
acc_mag = sqrt(AccX.^2 + AccY.^2 + AccZ.^2);


% Smooth acceleration data using a moving average filter
window_size = 100;
smoothed_acc = movmean(acc_mag, window_size);

% Find local maxima in the smoothed acceleration data
min_peak_height = 2; % adjust as needed
min_peak_distance = 50; % adjust as needed
[peaks, locs] = findpeaks(acc_mag, 'MinPeakHeight', min_peak_height);

% [peaks, locs] = findpeaks(smoothed_acc);

% Identify the indices of the end of the third spike
num_spikes = 3; % adjust this value as needed
end_idx = locs(num_spikes);

figure;
plot(Xs_acc,acc_mag);
hold on;

start_time = Xs_acc(end_idx+100)
end_time = Xs_acc(end-1500)
% Delete everything before the end of the third spike
Xs_acc = Xs_acc(end_idx+100:end);
AccX = AccX(end_idx+100:end);
AccY = AccY(end_idx+100:end);
AccZ = AccZ(end_idx+100:end);
Xs_acc_org = Xs_acc;
initial_timestamp = Xs_acc(1);
Xs_acc = Xs_acc - initial_timestamp;

% Save the modified acceleration data to a new file
save('acc_modified.mat', 'Xs_acc', 'AccX', 'AccY', 'AccZ');
acc_mag = sqrt(AccX.^2 + AccY.^2 + AccZ.^2);

plot(Xs_acc,acc_mag);
hold off;
legend('acc','acc modified');
%% Getting EMG Data 
load("emg.mat");

figure;
plot(Xs,emg_rms);       
idx = (Xs >= min(Xs_acc_org)) & (Xs <= max(Xs_acc_org));

Xs = Xs(idx);
emg = emg(idx);
emg_rms = emg_rms(idx);

timestamp = Xs(1);
Xs = Xs - timestamp;


hold on;
plot(Xs,emg_rms);
hold off;
save("emg_modified.mat","emg_rms","emg","Xs");
%% Getting Gaze Data 


initial_timestamp = Xs_gaze(1);
Xs_gaze = Xs_gaze - initial_timestamp;

missing_indices = find(isnan(gazeX) | isnan(gazeY));

gazeX(missing_indices) = interp1(Xs_gaze(~isnan(gazeX)), gazeX(~isnan(gazeX)), Xs_gaze(missing_indices));
gazeY(missing_indices) = interp1(Xs_gaze(~isnan(gazeY)), gazeY(~isnan(gazeY)), Xs_gaze(missing_indices));

save('gaze.mat', 'Xs_gaze', 'gazeX', 'gazeY');