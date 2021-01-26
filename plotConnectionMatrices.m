%% Plot Amplitude Value of Connection Matrices Over Time

% Model files
files = char('duple.mat', 'triple.mat', 'audonly.mat', 'vestonlydup.mat', 'vestonlytrip.mat');
[numFiles, ~] = size(files); % get size for For Loop

% Specify network num and con num
netNum = 1; % auditory layer
connNum = 2; % internal auditory connections

% To grab a diagnol
finalTimeStep = 64;

for j = 1:numFiles
    
    % Load file
    load(files(j, :))
    
    % Time steps of CM states
    connT = M.n{netNum}.con{connNum}.t;

    % Find max amplitude value in CM
    % [fromFreqRow,toFreqCol] = find(M.n{netNum}.con{connNum}.C==max(max(M.n{netNum}.con{connNum}.C)));

    % Connection Matrix parameters for duple freq
    %fromFreq = 1.504;
    %toFreq = 3.008;

    % Find row and col of freqs
    %[~,fromFreqRow] = min(abs(M.n{netNum}.f-fromFreq));
    %[~,toFreqCol] = min(abs(M.n{netNum}.f-toFreq));
    %toFreqCol = length(M.n{netNum}.f) - toFreqCol;

    %% Duple-Related Freqs

    fromFreqRow = 69; % index for ~ 1.5 Hz in CM
    toFreqCol = 99; % index for ~ 3 Hz in CM

    % Collapse into 2-D time series to plot
    connDT_trip15 = reshape(M.n{netNum}.con{connNum}.C3(fromFreqRow,toFreqCol,:), 1, length(connT));
    connDT_trip15 = abs(connDT_trip15);
    
    % Grab row at 1.5 Hz
    row = abs(M.n{netNum}.con{connNum}.C3(fromFreqRow,:,finalTimeStep));
    % plot(M.n{1,1}.f, row);
    
    % Save time series of CM
    fileName = strcat(files(j, :),'_15-3.mat');
    save(fileName, 'connDT_trip15');
    
    % Save row
    fileName = strcat(files(j, :),'_15_row.mat');
    save(fileName, 'row');

    %% Triple-Related Freqs

    % 0.5 to 1 Hz
    fromFreqRow = 51; % index for ~ 1 Hz in CM
    toFreqCol = 21; % ~ index for ~ 0.5 Hz in CM

    % Collapse into 2-D time series to plot
    connDT_trip05 = reshape(M.n{netNum}.con{connNum}.C3(fromFreqRow,toFreqCol,:), 1, length(connT));
    connDT_trip05 = abs(connDT_trip05);
    
    % Save time series
    fileName = strcat(files(j, :),'_05-1.mat');
    save(fileName, 'connDT_trip05');
    
    % 1 to 3 Hz
    fromFreqRow = 51; % index for ~ 1 Hz in CM
    toFreqCol = 99; % index for ~ 3 Hz in CM
    
    % Grab row at 1 Hz
    row = abs(M.n{netNum}.con{connNum}.C3(fromFreqRow,:,finalTimeStep));
    %plot(M.n{1,1}.f, row);
    
    % Collapse into 2-D time series to plot
    connDT_trip1 = reshape(M.n{netNum}.con{connNum}.C3(fromFreqRow,toFreqCol,:), 1, length(connT));
    connDT_trip1 = abs(connDT_trip1);
    
    % Save time series
    fileName = strcat(files(j, :),'_1-3.mat');
    save(fileName, 'connDT_trip1');
    
    % Save row
    fileName = strcat(files(j, :),'_1_row.mat');
    save(fileName, 'row');
    
    clear -files -numFiles -netNum -connNum
    
end
