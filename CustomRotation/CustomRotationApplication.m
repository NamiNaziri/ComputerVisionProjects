clc; close all; clear;

% Reading the image from the source
im = imread('Test_01.ppm');
imwrite(im, 'im.png');


% Rotate it by certain angle
CustomRotatedImage = CustomRotate(im, 180);

% Displaying the image
figure;imshow(CustomRotatedImage,[]),title('rotated by custom rotation');

imwrite(CustomRotatedImage, 'CustomRotatedImage.png');