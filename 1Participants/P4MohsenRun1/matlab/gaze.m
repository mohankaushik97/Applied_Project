close all;
clear;
clc;



load("gaze.mat");

gazeX = movmean(gazeX,100);
gazeY = movmean(gazeY,100);

missing_indices = find(isnan(gazeX) | isnan(gazeY));

gazeX(missing_indices) = interp1(Xs_gaze(~isnan(gazeX)), gazeX(~isnan(gazeX)), Xs_gaze(missing_indices));
gazeY(missing_indices) = interp1(Xs_gaze(~isnan(gazeY)), gazeY(~isnan(gazeY)), Xs_gaze(missing_indices));


plot(gazeX);
hold on;
plot(gazeY);
legend("X","Y");
