%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Modelling Auditory-Vestibular Interactions in Infant Rhythm Perception
%
% Dynamical systems model of Phillips-Silver & Trainor (2005), Science
% Implemented using the Gradient Frequency Neural Network (GrFNN) Library
% https://github.com/MusicDynamicsLab/GrFNNToolbox
%
% Test Procedure
%
% Model is a two-layer neural net (auditory & motor) with efferent cons.
% Auditory connections are loaded from previously trained network
% Then, auditory network is tested on unaccented rhythm
% 
% Parker Tichko, 2019, parker.tichko@uconn.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%% 1. Specify Network Connections to Test
% set connection type to load into auditory network

netType = 'duple';

% 'duple' = auditory-vestibular, with duple-vestibular training
% 'triple' = auditory-vestibular, with triple-vestibular training
% 'audonly' = auditory-only, unaccented rhytm w/no vestibular
% 'vestonlydup' = vestibular-only, duple-vestibular training w/no rhythm
% 'vestonlytrip' = vestibular-only, triple-vestibular training w/no rhythm

%% 2. Set Figure Paths
numOsc = '121';                                 % organize figures by num of oscilators in network
figurePaths_Test                                % set figure path

%% 3. Set Model parameters
modelParameters                                 % network parameter regime and learning rule

%% 4. Make model
makeModel = 'makeRhythm';

%% 5. Run Test Trials
experimentRhythms_Test



