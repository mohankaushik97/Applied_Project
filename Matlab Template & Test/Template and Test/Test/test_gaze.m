% Generate example data
x = linspace(0, 10, 100);
y = sin(x) + 0.5*randn(size(x)); % Simulated data with noise

% Set the minimum peak height and minimum peak distance
minPeakHeight = 0.5;
minPeakDistance = 1.0;

% Find peaks in the data
[pks, locs] = findpeaks(y, 'MinPeakHeight', minPeakHeight, 'MinPeakDistance', minPeakDistance);

% Plot the data
plot(x, y);
hold on;

% Label the peaks
for i = 1:length(locs)
    % Find the start index of the peak
    startIdx = locs(i);
    while startIdx > 1 && y(startIdx) > y(startIdx - 1)
        startIdx = startIdx - 1;
    end
    
    % Plot a marker at the start of the peak
    plot(x(startIdx), y(startIdx), 'ro', 'MarkerSize', 10);
    
    % Add a text label for the peak
    text(x(startIdx), y(startIdx), ['Peak ', num2str(i)], 'VerticalAlignment', 'bottom');
end

hold off;

% Add labels and title
xlabel('X');
ylabel('Y');
title('Peaks in the Data');
