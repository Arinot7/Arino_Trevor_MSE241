% Title: ImageCompiler
% Author: Trevor Arino
% Created: April 24, 2023
% Last Edited: April 24, 2023
% Summary: Used to compile TEM images at various tilt values into a single
% .mat file to import in to tomviz to generate tomography projections.

close all; clear; clc;

%% Loading images

% Checking how many items are in the folder
num_images = dir(['Images' '\*.tif']);

num_images = numel(num_images);

%% Compiling images into .mat file

list = dir("Images\*.tif");
filenames = {list.name};
pathnames = {list.folder};



for i = 1:num_images

    filename = filenames{i};
    pathname = pathnames{i};
    ImagesToSave{i} = imread(fullfile(pathname, filename));

end

save('test.mat', ImagesToSave{:})
