% close all;
% clear;
% clc;

load("gaze.mat");

gazeX = movmean(gazeX,100);
gazeY = movmean(gazeY,100);

plot(gazeX);
hold on;
plot(gazeY);
