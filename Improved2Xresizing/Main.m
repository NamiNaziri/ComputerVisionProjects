clc; close all; clear;

src = imread('Test/House.png');
Inimg = imread('Test/LR_House.png');

% The second parameter is the magic number. by changing it we can produce
% better quality images. ofcourse based on the current sample test cases
% the magic number of 1 gives us the best quality. but 0.2 gives us almost
% best quality in every cases.

tic
final = DHInterpolation(Inimg,1);
toc

resized = imresize(Inimg,2,'Bilinear');

psnr(uint8(resized), src)
psnr(uint8(final), src)