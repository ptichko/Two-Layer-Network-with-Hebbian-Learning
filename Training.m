%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Modelling Auditory-Vestibular Interactions in Infant Rhythm Perception
%
% Dynamical systems model based on Phillips-Silver & Trainor (2005), Science
% Implemented using the Gradient Frequency Neural Network (GrFNN) Library
% https://github.com/MusicDynamicsLab/GrFNNToolbox
%
% Training Procedure
%
% Model is a two-layer neural net (auditory & motor) with efferent conns.
% Auditory layer is trained on an unaccented rhythm.
% Motor layer is 'bounced' with a duple- or triple-rate sinewave.
% 
% Parker Tichko, 2019, parker.tichko@uconn.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%% 1. Specify Training Procedure
% Set network type to train a particular model

netType = 'duple';

% 'duple' = auditory-vestibular, with duple-vestibular training
% 'triple' = auditory-vestibular, with triple-vestibular training
% 'audonly' = auditory-only, unaccented rhytm w/no vestibular
% 'vestonlydup' = vestibular-only, duple-vestibular training w/no rhythm
% 'vestonlytrip' = vestibular-only, triple-vestibular training w/no rhythm


%% 2. Model parameters
modelParameters                              % network and learning-rule parameters

%% 3. Make model and initialize CMs
C2 = [];                                     % Initialize auditory connection matrix
makeModel = 'makeRhythm';                    % Make model

%% 4. Figure Paths
numOsc = '121';                              % Organize figures by num of oscs in network
figurePaths_Train                            % Create figure paths to save Matlab Figs

%% 5. Train Network
experimentRhythms_Training
