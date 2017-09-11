clc;
clear all;

Imgs = dir(fullfile('path_to_the_images','*.png'));
for j = 1:length(Imgs)
    Img = imread(fullfile('path_to_the_images',Imgs(j).name));
    im = rgb2gray(Img);  
    A = rgb2gray(im);

    lambda= 0.2966;       % declare the parameters of gabor filter function
    sigma = 0.01867;        
    theta = 0.8479;

% A total of 24 images are obtained for 4 scales and 6 orientations declared for the Gabor filter
    for i=1:4           
      
        for theta=0:pi/6:pi/2      % loop over orientation 0 to 90 deg in steps of 30 deg
         
            w = gabor_filter_function(theta,lambda(i),0,sigma(i),sigma(i),0.5);
            %figure;
            %imagesc(w);
            %colormap(gray);
            %title(sprintf('FILTER for \\theta = %d \\lambda=%d',round(theta*(180/pi)),lambda));
            y = convolve2(A,w);
 
        end
      
    end
  
end
