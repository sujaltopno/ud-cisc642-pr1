%Sujal Amrit Topno
%CISC642

clear all
close all

M = csvread('given_computer_perspective.csv',1,0);
I = imread('given_computer_original.png');

fixedPoints = [M(:,1) M(:,2)];
movingPoints = [M(:,3) M(:,4)];
tform = fitgeotrans(fixedPoints,movingPoints,'projective');
outputImage = imwarp(I, tform);
imshow(outputImage);
O = tform.T';
disp('X2 Matrix using built-in function');
disp(O);
