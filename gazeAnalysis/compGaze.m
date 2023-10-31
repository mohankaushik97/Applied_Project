close all;
clear all;
clc;

load('gazeDataAll.mat');
%% P1

minPeakDistance = 100;
[peaks, locs] = findpeaks(p1gazeY, 'SortStr', 'descend','MinPeakDistance',minPeakDistance);

top20peaks = peaks(1:20);
top20locs = locs(1:20);


subplot(3,2,1);
plot(p1Xs_gaze,p1gazeX);
hold on;
plot(p1Xs_gaze,p1gazeY);
% plot(p1Xs_gaze,p1gaze);
plot(p1Xs_gaze(top20locs), top20peaks, 'r*', 'MarkerSize', 10);

hold off;
title("P1");
%% P2

minPeakDistance = 100;
[peaks, locs] = findpeaks(p2gazeY, 'SortStr', 'descend','MinPeakDistance',minPeakDistance);

top20peaks = peaks(1:20);
top20locs = locs(1:20);

subplot(3,2,2);
plot(p2Xs_gaze,p2gazeX);
hold on;
plot(p2Xs_gaze,p2gazeY);
plot(p2Xs_gaze(top20locs), top20peaks, 'r*', 'MarkerSize', 10);

hold off;
title("P2");
%% P3

minPeakDistance = 100;
[peaks, locs] = findpeaks(p3gazeY, 'SortStr', 'descend','MinPeakDistance',minPeakDistance);

top20peaks = peaks(1:20);
top20locs = locs(1:20);

subplot(3,2,3);
% plot(p3Xs_gaze,p3gazeX);
hold on;
plot(p3Xs_gaze,p3gazeY);
plot(p3Xs_gaze(top20locs), top20peaks, 'r*', 'MarkerSize', 10);
hold off;
title("P3");

%% P4

minPeakDistance = 100;
[peaks, locs] = findpeaks(p4gazeY, 'SortStr', 'descend','MinPeakDistance',minPeakDistance);

top20peaks = peaks(1:20);
top20locs = locs(1:20);

subplot(3,2,4);
% plot(p4Xs_gaze,p4gazeX);
hold on;
plot(p4Xs_gaze,p4gazeY);
plot(p4Xs_gaze(top20locs), top20peaks, 'r*', 'MarkerSize', 10);

hold off;
title("P4");
%% P5
minPeakDistance = 100;
[peaks, locs] = findpeaks(p5gazeY, 'SortStr', 'descend','MinPeakDistance',minPeakDistance);

top20peaks = peaks(1:20);
top20locs = locs(1:20);


subplot(3,2,5);
% plot(p5Xs_gaze,p5gazeX);
hold on;
plot(p5Xs_gaze,p5gazeY);
plot(p5Xs_gaze(top20locs), top20peaks, 'r*', 'MarkerSize', 10);

hold off;
title("P5");

