%% Create unaccented rhythms from Phillips-Silver & Trainor (2005, 2007)
% Note matrix for unaccented rhythms (Phillips-Silver & Trainor, 2007)
% Strong events at 90 MIDI velocity value
% Weak events at 88 MIDI velocity value

% Load in MIDI file, but then change the midi velocity values 
s1 = stimulusMake(1, 'mid', '90BPM_unaccented_rhythm_64cycles_slapstick.mid', 'display', 1);

nmat(nmat(:,5) == 50, 5) = 88;
nmat(nmat(:,5) == 60, 5) = 90; 

% Save note matrix
save('nmat.mat', 'nmat');

%% Create unaccented rhythms from Phillips-Silver & Trainor (2005, 2007)
% Strong events were 60 dB
% Weak events were 50 dB

% Calculte PA value for MIDI velocity
% Pa2dB(60) = 129.5424
% Pa2dB(55) = 128.7867
% Pa2dB(50) = 127.9588

% Load in MIDI file, but then change the midi velocity values 
s1 = stimulusMake(1, 'mid', '90BPM_unaccented_rhythm_64cycles_slapstick.mid', 'display', 1);

nmat = s1.Notes;
nmat(nmat(:,5) == 88, 5) = 127.9588; %change 50 dB
nmat(nmat(:,5) == 90, 5) = 129.5424; %change 60 dB

% Save note matrix
save('nmat_unaccented.mat', 'nmat');

%% Duple accented rhythms from Phillips-Silver & Trainor (2005, 2007)

% Duple accented
% Load in MIDI file, but then change the midi velocity values 
s1 = stimulusMake(1, 'mid', '90BPM_unaccented_rhythm_64cycles_slapstick.mid', 'display', 1);

% Create duple accents 
nmat = s1.Notes;
nmat(nmat(:,5) == 88, 5) = 127.9588; %change 50 dB
nmat(nmat(:,5) == 90, 5) = 129.5424; %change 60 dB
nmat(4:6:end, 5) = 128.7867; %change weak beats to 55 dB for every 4 out of 6 beats

% Save note matrix
save('nmat_duple.mat', 'nmat');

%% Triple accented rhythms from Phillips-Silver & Trainor (2005, 2007)
% Load in MIDI file, but then change the midi velocity values 
s1 = stimulusMake(1, 'mid', '90BPM_unaccented_rhythm_64cycles_slapstick.mid', 'display', 1);

% Create triple accents
nmat = s1.Notes;
nmat(nmat(:,5) == 88, 5) = 127.9588; %change 50 dB
nmat(nmat(:,5) == 90, 5) = 129.5424; %change 60 dB
nmat(3:6:end, 5) = 128.7867; %change weak beats to 55 dB for every 3 out of 6 beats
nmat(5:6:end, 5) = 128.7867; %change weak beats to 55 dB for every 5 out of 6 beats

% Save note matrix
save('nmat_triple.mat', 'nmat');

