%% Extraction of hue-saturation features from images

clc;
clear all;
srcFiles = dir('path_to_the_images*.png');
   for i = 1 : length(srcFiles)
         filename = strcat('path_to_the_images',srcFiles(i).name);
         I = imread(filename);
         [m n] = size(I);
         q = m*n;
         Y = rgb2hsv(I);         % converting the images from RGB to HSV color space
         h = Y(:,:,1);           % accessing the hue channel
         s = Y(:,:,2);           % accessing saturation channel
         h1 = sum(h);               
         h2 = sum(h1);
         h3 = h2/q;              % normalized hue feature

         s1 = sum(s);
         s2 = sum(s1);
         s3 = s2/q;              % normalized saturation feature
         feat = [h3 s3]
   end
