clc; close all; clear;

im = imread('Test/Statue of David.png');
greyImage = double(rgb2gray(im));
out = FloydSteinberg(im);
figure
imshow([greyImage uint8(out)])

