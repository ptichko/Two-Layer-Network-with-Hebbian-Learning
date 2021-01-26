%% Create and set paths to save Matlab figures %%
% If the folder doesn't exist, create the folder.
% The figures are saved: current directory/a folder titled the number of
% oscs in network / folders detailing the training and test procedure

currentFolder = cd;

switch(netType)
    case 'duple'
        % Duple Test
        unaccentedtest = fullfile(currentFolder,numOsc,'duple','test','unaccented');
        test = fullfile(currentFolder,numOsc,'duple','test');
            
    case 'triple'
        unaccentedtest = fullfile(currentFolder,numOsc,'triple','test','unaccented');
        test = fullfile(currentFolder,numOsc,'triple','test');
    
    case 'audonly'
        
        unaccentedtest = fullfile(currentFolder,numOsc,'audonly','test','unaccented');
        test = fullfile(currentFolder,numOsc,'audonly','test');
    
    case 'vestonlydup'
        
        unaccentedtest = fullfile(currentFolder,numOsc,'vestonlydup','test','unaccented');
        test = fullfile(currentFolder,numOsc,'vestonlydup','test');
    
    case 'vestonlytrip'
        
        unaccentedtest = fullfile(currentFolder,numOsc,'vestonlytrip','test','unaccented');
        test = fullfile(currentFolder,numOsc,'vestonlytrip','test');
        
end

 desiredFolder = {unaccentedtest, test};

%Create folders if they don't exist already
for i = 1:length(desiredFolder)
                if ~exist(desiredFolder{i}, 'dir')
                mkdir(desiredFolder{i});
                end
            end
