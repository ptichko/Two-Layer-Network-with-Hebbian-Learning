%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test script
% Auditory connections are loaded from previously trained network
% Then, auditory network is tested on unaccented rhythm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

matfilename = sprintf('testrhythms.mat');

%% TEST Rhythm: Unaccented Rhythm %%

%%%%%% Trained auditory connections %%%%%%
switch(netType)
    case 'duple'
        load '.\121\duple\training\duple_weights.mat'           % duple-trained weights
    case 'triple'
        load '.\121\triple\training\triple_weights.mat'         % triple-trained weights
    case 'audonly'
        load '.\121\audonly\training\audonly_weights.mat'       % auditory-only weights
    case 'vestonlydup'
        load '.\121\vestonlydup\training\vestonlydup_weights.mat'   % vestibular-only: duple weights
    case 'vestonlytrip'
        load '.\121\vestonlytrip\training\vestonlytrip_weights.mat' % vestibular-only: triple weights
end

%%%%%% Unaccented rhythm %%%%%%
load nmat_unaccented.mat                                        % Note matrix for unaccented rhythm
nmat = nmat(1:(length(nmat)/2),:);                              % Half the number of rhythm cycles
s1 = stimulusMake(1, 'mid', nmat, 'display', 1);                % Create rhythm stimulus
s1.x = ampMult*s1.x/rms(s1.x);                                  % Scale stimulus amplitude
s1.x = hilbert(s1.x);
s1.fileName = '90BPM_unaccented_rhythm_32cycles_slapstick.mid'; % Rename stimulus

%%%%%%% Need sinewave to run test phase %%%%%%%
phase.start = -2*pi*1*.03;                                      % Set start phase:.03 = 30 ms = half of the pulse width
s2 = stimulusMake(2, 'fcn', s1.ts, 160, {'exp'}, [1], ...       % Sinewave at triple rate: 1000/999 = 1 hz = triple rate
.8, phase.start, 'ramp', 0.02, 1, 'display', 10);
s2.x = s2.x * 0;                                                % Cancel out vestibular input

% Print rhythm name
filename = sprintf(s1.fileName);                            
disp(filename)

%%%%%%% TEST: Unaccented Rhythm %%%%%%%
for ii = 1:1
    
    % Run  model
    eval(makeModel);
    ii;
    M = odeRK4fs(M);
    
    save(matfilename)                                           % Save complete model
    
end


%%%%%% Compute Average Oscillator Amplitudes %%%%%%
ampdata = abs(M.n{1}.Z);                                                  % Amplitude of network oscillators
org_oscamp = ampdata(1:end,(floor([length(ampdata)/2]):length(ampdata))); % Latter half of total cycles
%org_oscamp = ampdata(1:end,(1:floor([length(ampdata)/2])));              % First half of total cycles
org_oscamp = mean(org_oscamp,2);                                          % Average oscillator amplitude

close all;

%% FIGURE: Average Osc Amplitudes

%%%%%% Create figure of Average Osc Amp %%%%%%
figure
hold on

plot(M.n{1,2}.f(1:end), org_oscamp(1:end), 'LineWidth',2);                  % Amps to unaccented rhythm
legend('Unaccented');
set(gca, 'XLim', [0, 4.25])

title('Oscillator Amplitudes');
xlabel('Natural Frequency (Hz)');
ylabel('Amplitude (a.u.)');

hold off





