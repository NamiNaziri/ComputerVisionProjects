clc; close all; clear;

img = im2double(imread('Q2/Cells.tif'));

CreateCellInfo(img, 'CellInfo.xlsx');