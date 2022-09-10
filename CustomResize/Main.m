clc; close all; clear;

img = imread('Test/House.png');
resizedImage = CustomResize(img,2);
figure 
imshow(resizedImage);
resizedImage = CustomResize(img,0.3);

figure 
imshow(resizedImage);
resizedImage = CustomResize(img,0.76);

figure 
imshow(resizedImage);
resizedImage = CustomResize(img,0.6);
imwrite(resizedImage,'resizedImage.png');

figure 
imshow(resizedImage);

