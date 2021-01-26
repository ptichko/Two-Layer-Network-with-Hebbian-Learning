%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Training Procedure
% Implements either auditory, vestibular, or auditory-vestibular training.
% 
% 'duple' = auditory-vestibular, with duple-vestibular training
% 'triple' = auditory-vestibular, with triple-vestibular training
% 'audonly' = auditory-only, unaccented rhytm w/no vestibular
% 'vestonlydup' = vestibular-only, duple-vestibular training w/no rhythm
% 'vestonlytrip' = vestibular-only, triple-vestibular training w/no rhythm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%%
%%%%%% Unaccented rhythm %%%%%%
load nmat_unaccented.mat                                        % Note matrix for unaccented rhythm
s1 = stimulusMake(1, 'mid', nmat, 'display', 1);                % Create rhythm stimulus
s1.x = ampMult*s1.x/rms(s1.x);                                  % Scale stimulus amplitude
s1.x = hilbert(s1.x);                                           
s1.fileName = '90BPM_unaccented_rhythm_64cycles_slapstick.mid'; % Rename stimulus

%%%%%% Set training stimuli based on network type %%%%%%
switch(netType)
    
    %%%%%% Duple-vestibular training %%%%%%
    case('duple')                    
   
    phase.start = -2*pi*1.5*.03;                                % Set start phase: .03 = 30 ms = half of the pulse width   
    
    % Vestibular input    
    s2 = stimulusMake(2, 'fcn', s1.ts, 160, vestWave, [1.5], ... % Sine wave at duple rate: 1000ms/666ms = 1.5. 
        vestAmp, phase.start, 'ramp', 0.02, 1, 'display', 10); 
    
    matfilename = sprintf('duple.mat');                         % Name for model
    weightfilename = sprintf('duple_weights.mat');              % Name for CM
        
    
    %%%%%% Triple-vestibular training %%%%%%
    case('triple')
    
    phase.start = -2*pi*1*.03;                                  % Set start phase: .03 = 30 ms = half of the pulse width
        
    % Vestibular input    
    s2 = stimulusMake(2, 'fcn', s1.ts, 160, vestWave, [1], ...   % Sinewave at triple rate: 1000/999 = 1 hz = triple rate
    vestAmp, phase.start, 'ramp', 0.02, 1, 'display', 10);                                        

    matfilename = sprintf('triple.mat');                        % Name for model
    weightfilename = sprintf('triple_weights.mat');             % Name for CM
   
    
    %%%%%% Auditory-only training %%%%%%
    case('audonly')                       
    
    phase.start = -2*pi*1.5*.03;                                % Set start phase: .03 = 30 ms = half of the pulse width
     
    % Vestibular input
    % NOTE: Sine wave needs to be loaded for model to run
    s2 = stimulusMake(2, 'fcn', s1.ts, 160, vestWave, [1], ...   % Sinewave at triple rate: 1000/999 = 1 hz = triple rate
    .8, phase.start, 'ramp', 0.02, 1, 'display', 10);
    s2.x = s2.x * 0;                                            % Cancel out vestibular input
    
    matfilename = sprintf('audonly.mat');                       % Name for model
    weightfilename = sprintf('audonly_weights.mat');            % Name for CM
   
   
    %%%%%% Vestibular-only: duple %%%%%%
    case('vestonlydup')                  
   
    % NOTE: unaccented rhythm needs to be loaded for model to run
    s1.x = s1.x * 0;                                            % Cancel out unaccented rhtyhm training rhythm    
    
    phase.start = -2*pi*1*.03;                                  % Set start phase: .03 = 30 ms = half of the pulse width 
    
    % Vestibular input
    s2 = stimulusMake(2, 'fcn', s1.ts, 160, vestWave, [1.5], ... % Sine wave at duple rate: 1000ms/666ms = 1.5. 
    vestAmp, phase.start, 'ramp', 0.02, 1, 'display', 10);

    matfilename = sprintf('vestonlydup.mat');                   % Name for model
    weightfilename = sprintf('vestonlydup_weights.mat');       % Name for CM
    
    
   %%%%%% Vestibular-only: triple %%%%%%
    case('vestonlytrip')
      
    % NOTE: unaccented rhythm needs to be loaded for model to run
    s1.x = s1.x * 0;                                            % Cancel out unaccented rhtyhm training rhythm  
    
    phase.start = -2*pi*1*.03;                                % Set start phase: .03 = 30 ms = half of the pulse width
     
    % Sine wave at triple rate
    s2 = stimulusMake(2, 'fcn', s1.ts, 160, vestWave, [1], ...   % Sinewave at triple rate: 1000/999 = 1 hz = triple rate
    vestAmp, phase.start, 'ramp', 0.02, 1, 'display', 10);
   
    matfilename = sprintf('vestonlytrip.mat');                  % Name for model
    weightfilename = sprintf('vestonlytrip_weights.mat');       % Name for CM
        
end


disp(matfilename) % Print model name


%%%%%%% RUN AND TRAIN MODEL %%%%%%%
for ii = 1:1
    
    % Run model
    eval(makeModel);
    ii
    M = odeRK4fs(M);
    
    rhythmModelFigures                                      % Generate figures
    C2 = M.n{1}.con{2}.C;                                   % Update internal, auditory connections
    save(fullfile(trainingdir,weightfilename), 'C2');       % Save internal, auditory connections
    save(fullfile(trainingdir,matfilename));                % Save full model
end

% Save all currently opened figures
save_all_figures_to_directory(trainingdir);






