filename = 'gazeAnalysis.xlsx';
sheet = 'Data';

data = readtable(filename, 'Sheet', sheet);

Xs_gaze = data.Xs;
gazeX = data.GazeX;
gazeY = data.GazeY;

initial_timestamp = Xs_gaze(1);
Xs_gaze = Xs_gaze - initial_timestamp;

missing_indices = find(isnan(gazeX) | isnan(gazeY));

gazeX(missing_indices) = interp1(Xs_gaze(~isnan(gazeX)), gazeX(~isnan(gazeX)), Xs_gaze(missing_indices));
gazeY(missing_indices) = interp1(Xs_gaze(~isnan(gazeY)), gazeY(~isnan(gazeY)), Xs_gaze(missing_indices));

save('gaze.mat', 'Xs_gaze', 'gazeX', 'gazeY');