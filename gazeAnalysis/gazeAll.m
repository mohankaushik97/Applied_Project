%% P1 Mohan

filename = 'P1.xlsx';
sheet = 'Data';

data = readtable(filename, 'Sheet', sheet);

p1Xs_gaze = data.ComputerTimestamp/1000000;
p1gazeX = data.GazePointX;
p1gazeY = data.GazePointY;

initial_timestamp = p1Xs_gaze(1);
p1Xs_gaze = p1Xs_gaze - initial_timestamp;

missing_indices = find(isnan(p1gazeX) | isnan(p1gazeY));

p1gazeX(missing_indices) = interp1(p1Xs_gaze(~isnan(p1gazeX)), p1gazeX(~isnan(p1gazeX)), p1Xs_gaze(missing_indices));
p1gazeY(missing_indices) = interp1(p1Xs_gaze(~isnan(p1gazeY)), p1gazeY(~isnan(p1gazeY)), p1Xs_gaze(missing_indices));

p1gazeX = movmean(p1gazeX,200);
p1gazeY = movmean(p1gazeY,200);
p1gaze = sqrt(p1gazeX.^2 + p1gazeY.^2);

save('abs.mat','p1gaze');
%% P2 Naveen

filename = 'P2.xlsx';
sheet = 'Data';

data = readtable(filename, 'Sheet', sheet);

p2Xs_gaze = data.ComputerTimestamp/1000000;
p2gazeX = data.GazePointX;
p2gazeY = data.GazePointY;

initial_timestamp = p2Xs_gaze(1);
p2Xs_gaze = p2Xs_gaze - initial_timestamp;

missing_indices = find(isnan(p2gazeX) | isnan(p2gazeY));

p2gazeX(missing_indices) = interp1(p2Xs_gaze(~isnan(p2gazeX)), p2gazeX(~isnan(p2gazeX)), p2Xs_gaze(missing_indices));
p2gazeY(missing_indices) = interp1(p2Xs_gaze(~isnan(p2gazeY)), p2gazeY(~isnan(p2gazeY)), p2Xs_gaze(missing_indices));

p2gazeX = movmean(p2gazeX,200);
p2gazeY = movmean(p2gazeY,200);
p2gaze = sqrt(p2gazeX.^2 + p2gazeY.^2);

save('abs.mat','p2gaze');

%% P3 Anagha

filename = 'P3.xlsx';
sheet = 'Data';

data = readtable(filename, 'Sheet', sheet);

p3Xs_gaze = data.ComputerTimestamp/1000000;
p3gazeX = data.GazePointX;
p3gazeY = data.GazePointY;

initial_timestamp = p3Xs_gaze(1);
p3Xs_gaze = p3Xs_gaze - initial_timestamp;

missing_indices = find(isnan(p3gazeX) | isnan(p3gazeY));

p3gazeX(missing_indices) = interp1(p3Xs_gaze(~isnan(p3gazeX)), p3gazeX(~isnan(p3gazeX)), p3Xs_gaze(missing_indices));
p3gazeY(missing_indices) = interp1(p3Xs_gaze(~isnan(p3gazeY)), p3gazeY(~isnan(p3gazeY)), p3Xs_gaze(missing_indices));

p3gazeX = movmean(p3gazeX,200);
p3gazeY = movmean(p3gazeY,200);
p3gaze = sqrt(p3gazeX.^2 + p3gazeY.^2);

save('abs.mat','p3gaze');

%% P4 MR

filename = 'P4.xlsx';
sheet = 'Data';

data = readtable(filename, 'Sheet', sheet);

p4Xs_gaze = data.ComputerTimestamp/1000000;
p4gazeX = data.GazePointX;
p4gazeY = data.GazePointY;

initial_timestamp = p4Xs_gaze(1);
p4Xs_gaze = p4Xs_gaze - initial_timestamp;

missing_indices = find(isnan(p4gazeX) | isnan(p4gazeY));

p4gazeX(missing_indices) = interp1(p4Xs_gaze(~isnan(p4gazeX)), p4gazeX(~isnan(p4gazeX)), p4Xs_gaze(missing_indices));
p4gazeY(missing_indices) = interp1(p4Xs_gaze(~isnan(p4gazeY)), p4gazeY(~isnan(p4gazeY)), p4Xs_gaze(missing_indices));

p4gazeX = movmean(p4gazeX,200);
p4gazeY = movmean(p4gazeY,200);
p4gaze = sqrt(p4gazeX.^2 + p4gazeY.^2);

save('abs.mat','p4gaze');


%% 

filename = 'P5.xlsx';
sheet = 'Data';

data = readtable(filename, 'Sheet', sheet);

p5Xs_gaze = data.ComputerTimestamp/1000000;
p5gazeX = data.GazePointX;
p5gazeY = data.GazePointY;

initial_timestamp = p5Xs_gaze(1);
p5Xs_gaze = p5Xs_gaze - initial_timestamp;

missing_indices = find(isnan(p5gazeX) | isnan(p5gazeY));

p5gazeX(missing_indices) = interp1(p5Xs_gaze(~isnan(p5gazeX)), p5gazeX(~isnan(p5gazeX)), p5Xs_gaze(missing_indices));
p5gazeY(missing_indices) = interp1(p5Xs_gaze(~isnan(p5gazeY)), p5gazeY(~isnan(p5gazeY)), p5Xs_gaze(missing_indices));

p5gazeX = movmean(p5gazeX,200);
p5gazeY = movmean(p5gazeY,200);
p5gaze = sqrt(p5gazeX.^2 + p5gazeY.^2);

save('abs.mat','p5gaze');

%% P6

filename = 'P6.xlsx';
sheet = 'Data';

data = readtable(filename, 'Sheet', sheet);

p6Xs_gaze = data.ComputerTimestamp/1000000;
p6gazeX = data.GazePointX;
p6gazeY = data.GazePointY;

initial_timestamp = p6Xs_gaze(1);
p6Xs_gaze = p6Xs_gaze - initial_timestamp;

missing_indices = find(isnan(p6gazeX) | isnan(p6gazeY));

p6gazeX(missing_indices) = interp1(p6Xs_gaze(~isnan(p6gazeX)), p6gazeX(~isnan(p6gazeX)), p6Xs_gaze(missing_indices));
p6gazeY(missing_indices) = interp1(p6Xs_gaze(~isnan(p6gazeY)), p6gazeY(~isnan(p6gazeY)), p6Xs_gaze(missing_indices));

p6gazeX = movmean(p6gazeX,200);
p6gazeY = movmean(p6gazeY,200);
p6gaze = sqrt(p6gazeX.^2 + p6gazeY.^2);

save('abs.mat','p6gaze');

%% P7 

filename = 'P7.xlsx';
sheet = 'Data';

data = readtable(filename, 'Sheet', sheet);

p7Xs_gaze = data.ComputerTimestamp/1000000;
p7gazeX = data.GazePointX;
p7gazeY = data.GazePointY;

initial_timestamp = p7Xs_gaze(1);
p7Xs_gaze = p7Xs_gaze - initial_timestamp;

missing_indices = find(isnan(p7gazeX) | isnan(p7gazeY));

p7gazeX(missing_indices) = interp1(p7Xs_gaze(~isnan(p7gazeX)), p7gazeX(~isnan(p7gazeX)), p7Xs_gaze(missing_indices));
p7gazeY(missing_indices) = interp1(p7Xs_gaze(~isnan(p7gazeY)), p7gazeY(~isnan(p7gazeY)), p7Xs_gaze(missing_indices));

p7gazeX = movmean(p7gazeX,200);
p7gazeY = movmean(p7gazeY,200);
p7gaze = sqrt(p7gazeX.^2 + p7gazeY.^2);

save('abs.mat','p7gaze');

%% Save Data  

% "p7gazeY","p7gazeX","p7Xs_gaze","p6gazeY","p6gazeX","p6Xs_gaze","p5gazeY","p5gazeX","p5Xs_gaze","p4gazeY","p4gazeX","p4Xs_gaze","p3gazeY","p3gazeX","p3Xs_gaze","p2gazeY","p2gazeX","p2Xs_gaze","p1gazeY","p1gazeX","p1Xs_gaze"

save('gazeDataAll.mat',"p7gazeY","p7gazeX","p7Xs_gaze","p6gazeY","p6gazeX","p6Xs_gaze","p5gazeY","p5gazeX","p5Xs_gaze","p4gazeY","p4gazeX","p4Xs_gaze","p3gazeY","p3gazeX","p3Xs_gaze","p2gazeY","p2gazeX","p2Xs_gaze","p1gazeY","p1gazeX","p1Xs_gaze",'p7gaze','p6gaze','p5gaze','p4gaze','p3gaze','p2gaze','p1gaze');
%% Closeup
clear all;
clean all;
clc

