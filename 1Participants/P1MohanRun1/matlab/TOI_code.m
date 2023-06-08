 % Load acceleration data
close all;
clear;
clc;

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

start_time = Xs_acc(end_idx+500)
end_time = Xs_acc(end-1500)
% Delete everything before the end of the third spike
Xs_acc = Xs_acc(end_idx+500:end);
AccX = AccX(end_idx+500:end);
AccY = AccY(end_idx+500:end);
AccZ = AccZ(end_idx+500:end);

% Save the modified acceleration data to a new file
save('acc_modified.mat', 'Xs_acc', 'AccX', 'AccY', 'AccZ');
acc_mag = sqrt(AccX.^2 + AccY.^2 + AccZ.^2);

plot(Xs_acc,acc_mag);
hold off;
legend('acc','acc modified');
%%
load("emg.mat");

figure;
plot(Xs,emg_rms);       
idx = (Xs >= min(Xs_acc)) & (Xs <= max(Xs_acc));

Xs = Xs(idx);
emg = emg(idx);
emg_rms = emg_rms(idx);

hold on;
plot(Xs,emg_rms);
hold off;
save("emg_modified.mat","emg_rms","emg","Xs");