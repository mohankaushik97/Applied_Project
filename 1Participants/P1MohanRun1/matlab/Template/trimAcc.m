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



nonzero_rows = any([AccX, AccY, AccZ], 2);
Xs_acc = Xs_acc(nonzero_rows);
AccX = AccX(nonzero_rows);
AccY = AccY(nonzero_rows);
AccZ = AccZ(nonzero_rows);

% Save the updated column matrices to 'acc.mat'
save('acc.mat', 'Xs_acc', 'AccX', 'AccY', 'AccZ');

