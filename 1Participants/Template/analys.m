% save("emg.mat","Xs","Emg","Emg_rms");
% save("acc.mat","Xs_acc","AccX","AccY","AccZ");

clear all;
close all;
clc;

load("acc_modified.mat");
load("emg_modified.mat");

% plot(Xs,emg_rms);
% hold on;
%% EMG spike detection


% plot( emg_a);
% spike=zeros(25,2);
spike_emg =zeros(25,1);
spike_idx = zeros(25,1);
threshold = 1.4e-05;

wind= 1000;
k=1;
% for i = 2001:(length(emg_a)-2000)
i = wind + 1;
while i<=(length(emg_rms)-wind) 
    if (max(emg_rms(i-wind:i)))<=threshold && min(emg_rms(i+10:i+100)>= threshold)
        spike_emg(k)= emg_rms(i-850);
        spike_idx(k) = Xs(i-850);
        i = i+1000;
        k = k+1;
    else 
        i = i+1;
    end
end
spike_emg = nonzeros(spike_emg);
spike_idx = nonzeros(spike_idx);
%% Plot EMG spike starting points
figure;
plot(Xs,emg_rms);
hold on;
line([0 Xs(end)], [threshold threshold], 'LineWidth', 0.5, 'Color', 'k');
plot(spike_idx,spike_emg,'r*');
hold off;
title("EMG Spike Points");
%%  ACC spike data. 

Acc = sqrt(AccX.^2 + AccY.^2 + AccZ.^2);

Acc_rms = movmean(Acc,100);

Acc_diff = diff(Acc_rms);

Xs_acc_diff = diff(Xs_acc);

Acc_slope = Acc_diff./Xs_acc_diff;
Acc_slope(end+1) = NaN;


slope_rms = movmean(Acc_slope,100);

% plot(Xs_acc,Acc);
% hold on;
% plot(Acc_rms);
figure;
plot(Acc_rms);
hold on;
% plot(Xs_acc,Acc_slope);
plot(slope_rms);
legend("Acc rms","slope rms");
hold off;
title("RMS of ACC and slope of ACC");
%% Ploting the ACC spike points. 

spike_acc =zeros(25,1);
acc_idx = zeros(25,1);
lower_th = 0.015;
upper_th = 0.05;

window= 100;
k=1;
% for i = 2001:(length(emg_a)-2000)
i = 100+ window + 1;
while i<=(length(slope_rms)-window) 
    if (max(slope_rms(i-window:i)))<=lower_th && min(slope_rms(i+5:i+25)>= lower_th)
        spike_acc(k)= Acc_rms(i+20);
        acc_idx(k) = Xs_acc(i+20);
        i = i+650;
        k = k+1;
    else 
        i = i+1;
    end
end
spike_acc = nonzeros(spike_acc);
acc_idx = nonzeros(acc_idx);
%%

figure;
plot(Xs_acc,slope_rms);
hold on;
line([0 Xs_acc(end)], [upper_th upper_th], 'LineWidth', 0.5, 'Color', 'k');
line([0 Xs_acc(end)], [lower_th lower_th], 'LineWidth', 0.5, 'Color', 'c');
hold off;
title("threshold for ACC");

figure;
plot(Xs_acc,Acc_rms);
hold on;
plot(acc_idx,spike_acc,'r*');
hold off;
title("ACC Spikes");
%% 
% close all;

load('gaze.mat');

figure;
Xs_gaze = Xs_gaze./1000000;
gaze = sqrt(gazeX.^2 + gazeY.^2);
gaze_rms = movmean(gaze,200);
title("movement points in Gaze");

% plot(x, y);
% hold on;
% plot(x(locs), pks, 'ro', 'MarkerSize', 10);
% hold off;

% plot(Xs_gaze,gazeX);
% plot(Xs_gaze,gaze_rms);
% hold on;


gaze_diff = diff(gaze_rms);

Xs_gaze_diff = diff(Xs_gaze);

gaze_slope = gaze_diff./Xs_gaze_diff;
gaze_slope(end+1) = NaN;

gaze_slope_rms = movmean(gaze_slope,100);

% plot(Xs_gaze,gaze_slope_rms);
plot(Xs_gaze,gaze_rms);

minPeakHeight = 40.0;
minPeakDistance = 100.0;

[pks, locs] = findpeaks(gaze_slope_rms,'MinPeakHeight', minPeakHeight, 'MinPeakDistance', minPeakDistance);
hold on;

gaze_move = locs - 100;

% plot(Xs_gaze(locs), pks, 'r*', 'MarkerSize', 10);

plot(Xs_gaze(gaze_move), gaze_rms(gaze_move), 'r*', 'MarkerSize', 10);


% 
% Acc_diff = diff(_rms);
% 
% Xs_acc_diff = diff(Xs_acc);
% 
% Acc_slope = Acc_diff./Xs_acc_diff;
% Acc_slope(end+1) = NaN;
% 
% 
% slope_rms = movmean(Acc_slope,100);
% 
% %% 
% figure;
% subplot(3,1,1);
% plot(Xs_acc,Acc_rms);
% subplot(3,1,2);
% plot(Xs,emg_rms);
% subplot(3,1,3);
% plot(Xs_gaze,gaze_rms);

%%
figure;
plot(acc_idx(1:end-1),1,'b*');
hold on;
plot(spike_idx(1:end-1),1,'k+');
plot(Xs_gaze(gaze_move), 1,'r.');
hold off;
legend('Accelerometer(*)','EMG(+)','Gaze(.)');
title("Acc vs EMG vs Gaze");

diff_idx = spike_idx(1:end-1)-acc_idx(1:end-1);
emg_diff = mean(diff_idx)*1000;
gaze_diff = mean(Xs_gaze(gaze_move)-spike_idx(1:end-1))*1000;
message = "On average, the emg signals are about " + num2str(emg_diff) + "ms" + ...
    " ahead of accelerometer and the gaze signals are about " + ... 
num2str(gaze_diff) + "ms ahead of emg signals.";
disp(message);