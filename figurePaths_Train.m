%% Creates and sets paths to save Matlab figures %%
% If the folder doesn't exist, create the folder.
% The figures are saved: current directory/a folder titled the number of
% oscs in network / folders detailing the training and test procedure

currentFolder = cd;

switch(netType)
    case 'duple'
        % Duple Test
        trainingdir = fullfile(currentFolder,numOsc,'duple','training');
            
    case 'triple'
        trainingdir = fullfile(currentFolder,numOsc,'triple','training');
    
    case 'audonly'
        trainingdir = fullfile(currentFolder,numOsc,'audonly','training');
    
    case 'vestonlydup'
        trainingdir = fullfile(currentFolder,numOsc,'vestonlydup','training');
    
    case 'vestonlytrip'
        trainingdir = fullfile(currentFolder,numOsc,'vestonlytrip','training');
        
end

    
desiredFolder = {trainingdir};

    for i = 1:length(desiredFolder)
        if ~exist(desiredFolder{i}, 'dir')
        mkdir(desiredFolder{i});
        end
    end

