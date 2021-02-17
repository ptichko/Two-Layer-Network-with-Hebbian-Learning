%% Network Layers %%

%%%%%% Auditory Network %%%%%%
n1 = networkMake(1, 'hopf', alpha1, beta11, beta12, delta11, delta12, neps1, ... 
                    'log', .3125, 5, 121, 'tick', 2.^(-1:3), ...
                    'display', 1, 'save', 1, 'zna', 0); 

%%%%%% Motor Network %%%%%%
n2 = networkMake(2,'hopf', alpha1, beta11, beta12, delta11, delta12, neps1, ...
        'log', .3125, 5, 121, 'tick', 2.^(-1:3), ...
        'display', 1, 'save', 1, 'zna', 0); 
    
%% Network Connections   

%%%%%% Network parameters %%%%%%
w = 0.5;                                                    % Internal connection weights
w2 = 0.75;                                                  % Efferent connection weights
C3  = connectMake(n2, n1, 'full', .0065);                   % Diffused auditory-motor connections

%%%%%% Connections to Stimuli %%%%%%       
n1 = connectAdd(s1, n1, 1, '1freq');                        % Rhythm to auditory network           
n1.con{1}.w = 2.0;                                          % Lower to allow the sine-wave to have a stronger effect
n2 = connectAdd(s2, n2, 1, '1freq');                        % Sine-wave to motor network

%%%%%% Internal, Auditory Plastic Connections %%%%%%       
n1 = connectAdd(n1, n1, C2, 'weight', w, 'type', '2freq', 0.0125, ... %2freq for mode-locking
    'learn', lambda, mu1, mu2, ceps, kappa, 'noscale', ...
    'display', 1,'phasedisp',1, 'save', 319);               % try saving CM every cycle, 319.4688, 64 cycles total

%%%%%% Efferent, Auditory-Motor Connections %%%%%%       
n1 = connectAdd(n2, n1, C3,'weight', w2, 'type', 'allfreq','display', 1,'phasedisp',1, 'save', 0);

%% Make Model  

%%%%%% Define Model %%%%%% 
M = modelMake(@zdot, @cdot, s1, s2, n1, n2);

