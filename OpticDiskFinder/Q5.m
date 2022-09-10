clc; close all; clear;



path = './01_test.tif';
Image = imread(path);

processedImage = Processing_V2(Image);

[row, col, radius] = houghAlgorithm(processedImage);

 imshow(Image)
 viscircles([col,row], radius,'Color','b');
 
 