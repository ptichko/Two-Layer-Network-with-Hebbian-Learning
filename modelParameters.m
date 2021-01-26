%% Model Parameters

%%%%%% Auditory and Motor Network Parameters %%%%%%
alpha1 = .015; beta11 =  -1; beta12 = -2;           % Supercritical Hopf Regime (Kim & Large, 2015)
delta11 =  0; delta12 = 0; neps1 = 1;              % See Kim & Large (2015) for more info

%%%%%% Stimulus Parameters %%%%%%
ampMult = 0.15/1;                                   % Auditory Rhythm Amplitude: 0.15 for the latest version
vestAmp = 0.8/1.5;                                  % Vestibular Amplitude: 0.8 for latest version
vestWave = {'exp'};                                 % Vestibular waveform.

Fs = 160;                                           % Sample rate

%%%%%% Hebbian Learning Parameters %%%%%%
lambda =  -.45; mu1 = 3; mu2 = -0.9; ceps = 2; kappa = 3; % Learning rule parameters
m1 = 0.025;                                                % Learning rate
lambda = m1*lambda; mu1 =  m1*mu1; mu2 = m1*mu2; kappa = m1*kappa; % Scale learning rule parameters by the learning rate.
