%% Source Code for the paper_____

clear all
close all
clc

addpath(genpath(erase(matlab.desktop.editor.getActiveFilename,'main.m')))
addpath('source')
addpath('data')
addpath('data/ncdf')

%% %%%%%% My inputs %%%%%%%%%%%%%

nbsimul = 100;%to reproduce the results it needs to be set at 100
do_seasonality = 'n' % 'y' or 'n'
scenario_Song = 'Gros' % 'Song' is Song, 'Gold' is Goldberg, 'Gros' is Grossman and Joachimski
detrended_Climate = 'n' %'y' adds the detrended climate (at 12PAL constant)
fossils = 'bra' %Fossil group can be 'tri', 'bra', 'con' or 'mar';

mapping_toolbox = 'y' %do you have the Matlab Mapping Toolbox, 'y' or not (makes the maps)

%% Cleaning working directory
delete GlobalCurve_Song.pdf Gradient_Song.pdf Regicurves_Song.pdf GlobalMaps_Song.png Temperature_Song.png Output_Song.mat Output_Cst8PAL.mat

%% The first step is to get the ncdf data
%We now have latitude, longitude and an array structure that contains 
%the matrices(4D) of the temperatures during the Ordovician

Step1_getncdf
disp('Step 1 we got the ncdf')

%% The second step is to regrid our matrices
%We want to regrid the outputs as 1°lat 1°long and have the matrices in
%order

Step2_regrid
disp('Step 2 we regrided our matrices')

%% Then we want to have the continental shelves and the continents
%We want masks for the continental shelves and the continents

Step3_masks
disp('Step 3 we have masks')

%% Quick Visual Verification
%you can visually check the matrices with this command line
%just change .test as what you wish to see;

if mapping_toolbox == 'y';
    Step4_visualverif
    disp('To check the temperatures of the continental shelves')
end

%% Save the matrices of the integrated temperatures of the continental shelves 
%we can also save latitude and longitude

% save('Matrices_Song', 'Song', 'Mask', 'latdef', 'longdef', 'nb')
% 
% clear all
% close all
% clc

%% loading the parameters of METAL SNCI
%to start the macroecological model, we first need:
%the temperature matrices
%and the niches

% load Matrices_Song
Step5_niches
disp('We have the niches')

%% METAL SNCI
if do_seasonality == 'y'
    Step6_METAL_seasonality
else
    Step6_METAL
%     Step6_METAL_allopatry
end
disp('Our species have settled')

Step6_Cst8PAL

%% The biodiversity curve
Step7_Figures

%% The Geographic maps
if mapping_toolbox == 'y';
    Step8_Maps
else 
    Step8b_SimpleMaps
end

%% The Latitudinal gradient
Step9_Gradient

%% The regional diversity curves
Step_10RegiCurves

%% Correlations
%Step11_correlations

rmpath(genpath(erase(matlab.desktop.editor.getActiveFilename,'main.m')))
