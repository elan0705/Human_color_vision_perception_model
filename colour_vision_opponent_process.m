%   Description:
%       colour vision-opponent process 
%
%   Other m-files required: face.jpg, tiger.png, leopard.png
%   MAT-files required: none
%
%   Author: Elangeshwaran
%   email: exk049@student.bham.ac.uk
%   Date: 23/05/2021
%% Input image 
k = imread('clr12.jpg'); %read input image
%displaying input image
fontSize = 15;
figure('Name','visual input');
imshow(k);
title('Original RGB Image', 'FontSize', fontSize);

%% Retina
%obtaining the featuers mimicing the L,M & S cone
redChannel = k(:,:,1); %redChannel 
greenChannel = k(:,:,2); %greenChannel
blueChannel = k(:,:,3); %blueChannel
allBlack = zeros(size(k, 1), size(k, 2), 'uint8');

red_img= cat(3, redChannel, allBlack, allBlack); % L-cone
green_img = cat(3, allBlack, greenChannel, allBlack); % M-cone
blue_img = cat(3, allBlack, allBlack, blueChannel); % S-cone
%displaying images
figure('Name','Retina capturing');
subplot(4,1,1);
imshow(red_img);
title('L-CONE(red)', 'FontSize', fontSize);
subplot(4,1,2);
imshow(green_img);
title('M-CONE(red)', 'FontSize', fontSize);
subplot(4,1,3);
imshow(blue_img);
title('S-CONE(red)', 'FontSize', fontSize);

%obtaining features mimicing the rod

brightnesscapture = (0.2126*redChannel + 0.7152*greenChannel + 0.0722*blueChannel);% rod
%displaying images
subplot(4,1,4);
image(brightnesscapture);
colorbar;
title('brightnesscapture', 'FontSize', fontSize);


%% Neuron
% luminance
luminance = red_img+green_img; % luminance signal derived by adding the signal from the red and green cones 
figure('Name','neuron processing');
subplot(3,1,1);
imshow(luminance);
title('luminance', 'FontSize', fontSize);

% Red-Green
redGreen = red_img-green_img; %red– green colour signal derived by subtracting the output of the green cones by that of the red cones
subplot(3,1,2); 
imshow(redGreen);
title('Red-Green', 'FontSize', fontSize);

% Yellow-Blue
yellowBlue = luminance-blue_img; %A blue– yellow colour signal derived by subtracting red-green and blue
subplot(3,1,3);
imshow(yellowBlue);
title('Yellow-Blue', 'FontSize', fontSize);

%% Visual Cortex
imageBrightness = abs(max(luminance)); %Brightness in image is taken as strength of luminance
figure('Name','Colour perception in Visual cortex');
subplot(3,1,1);
image(imageBrightness);
colorbar;
title('imageBrightness', 'FontSize', fontSize);
Hue = abs(yellowBlue./redGreen); %Hue is expressed as ratio of yellow-blue to red-green
subplot(3,1,2);
imshow(Hue);
title('Hue', 'FontSize', fontSize);
Colourfulness = abs(max(redGreen, yellowBlue)); % Colourfulness is taken by the strength of red-green and yellow-blue
subplot(3,1,3);
imshow(Colourfulness);
title('Colourfulness', 'FontSize', fontSize);

Lightness = rgb2hsv(Colourfulness); %hsv to obtaint the lightness values
figure('Name','other realtive features');
subplot(4,1,1);
imshow(Lightness);
title('Lightness', 'FontSize', fontSize);
 Avg_Hue= mean(Lightness(:,:,1)); %obtaining mean hue,saturation, brightness from HSV
 subplot(4,1,2);
image(Avg_Hue);
colorbar;
title('averagedHue', 'FontSize', fontSize);
 Avg_Saturation= mean(Lightness(:,:,2));
 subplot(4,1,3);
image(Avg_Saturation);
colorbar;
title('averagedSaturation', 'FontSize', fontSize);
 Avg_brightness= mean(Lightness(:,:,3));
 subplot(4,1,4);
image(Avg_brightness);
colorbar;
title('averagedBrightness', 'FontSize', fontSize);