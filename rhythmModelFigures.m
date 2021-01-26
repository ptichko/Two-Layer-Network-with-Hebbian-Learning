% FFT of stimulus
% Zero-pad FFT global value. 
zeropad = 2560; % Fs = 160. 160 * 16 second = 2560

% Grabs stimlulus for final two cyles
cycle.t = 64 - (12)*(1000/333);
begin = round((s1.t(end)-cycle.t:1/s1.fs:s1.t(end))*s1.fs);
  
%% Stimulus 1 and 2
% Comment this line in to plot last few cycles of stimulus + response
% t = s1.t;
% x = s1.x;
% x2 = s2.x;

% Time domain of stimulus 1 and 2
figure(10);

if exist('s2') == 1
%t = t-t(1);
    plot(s1.t, real(s1.x)/max(real(s1.x)), 'k', s2.t, real(s2.x)/max(real(s2.x)), 'b-', 'LineWidth', 1.5);
end
    
%% Unaccented Rhythm (Stimulus 1)

%Comment this line in to plot last few cycles of stimulus + response
%t = s1.t(begin);                   % Time steps for stimulus
t = s1.t;                           % Full stimulus duration

%%%%%% FFT of stimulus 1 %%%%%%
figure(13);

% nfft = length(s1.x);
nfft = zeropad;                     % Zero-pad FFT

y = fft((s1.x(begin)), nfft);       % FFT of stimulus 1
f = s1.fs/2*linspace(0,1,nfft/2);   % Create frequency vector
yas = abs(y(1:floor(nfft/2)))/nfft; % Spectral amplitudes of FFT

plot(f(2:end), yas(2:end)/max(yas(2:end))); % Plot and scale spectral amplitudes of FFT
set(gca, 'XLim', [0, 4.25])

legend('Unaccented Rhythm');
title('FFT of Unaccented Rhythm');
xlabel('Frequency (Hz)');
ylabel('Amplitude (a.u)');

%% Network 1 (Auditory)
%%%%%% Network 1: Average Osc Amplitudes %%%%%%%
figure (15);

ampdata = abs(M.n{1}.Z);                                                % Osc amplitude values
ampdata = ampdata(1:end,(floor([length(ampdata)/2]):length(ampdata)));  % 
ampdata = mean(ampdata,2);                                              % Compute average amp values

plot(M.n{1}.f(1:end), ampdata(1:end), 'LineWidth',2); 
set(gca, 'XLim', [0, 4.25])

legend('Auditory Network');
title('Average Oscillator Amplitudes');
xlabel('Frequency (Hz)');
ylabel('Amplitude (a.u.)');


%% Vestibular Input (Stimulus 2)

%%%%%% FFT of stimulus 2 %%%%%%
if exist('s2') == 1
    figure(23);
    % set(gcf, 'Position', [100        1170         525         175])

    %nfft = length(mf);
    nfft = zeropad; %zero-pad FFT

    y = fft((s2.x(begin)), nfft);                       % FFT of vestibular input
    f = s2.fs/2*linspace(0,1,nfft/2);                   % Vector of frequencies
    yas = abs(y(1:floor(nfft/2)))/nfft;                 % Spectral Amplitudes of FFT

    plot(f(2:end), yas(2:end)/max(yas(2:end)));
    set(gca, 'XLim', [0, 4.25])

    legend('Vestibular Input');
    title('Vestibular Input');
    xlabel('Frequency (Hz)');
    ylabel('Amplitude (a.u)');

end

%% Network 2 (Motor Network)

%%%%%% Average Oscilator Amplitudes %%%%%%%
figure(26);

ampdata = abs(M.n{2}.Z);
ampdata = ampdata(1:end,(floor([length(ampdata)/2]):length(ampdata)));
ampdata = mean(ampdata,2);

plot(M.n{2}.f(1:end), ampdata(1:end), 'LineWidth',2); 

set(gca, 'XLim', [0, 4.25])

title('Average Oscillator Amplitudes');
xlabel('Natural Frequency (Hz)');
ylabel('Amplitude (a.u.)');
    
