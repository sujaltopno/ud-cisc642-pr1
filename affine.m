%Sujal Amrit Topno
%CISC642

clc
clear all
close all

%% Initialisation
output = cell(10,1); %creating a cell to store the output of images

M = csvread('given_computer_affine.csv',1,0); %reading the CSV file, changing names to read different csv files from the same folder
I = imread('given_computer_original.png'); %reading the image file, changing names to read different images from the same folder

%% Generating X1 using built in function fitgeotrans
fixedPoints = [M(:,1) M(:,2)]; %[x y] for initial points (for method A)
movingPoints = [M(:,3) M(:,4)]; %[x' y'] for transformed points (for method A)
%fixedPoints = [M(1,1) M(1,2); M(2,1) M(2,2); M(3,1) M(3,2)]; %[x y] for initial points (for method B)
%movingPoints = [M(1,3) M(1,4); M(2,3) M(2,4); M(3,3) M(3,4)]; %[x' y'] for transformed points (for method B)

tformB = fitgeotrans(fixedPoints,movingPoints,'affine'); %creating tformB object from built-in function
outputImage = imwarp(I, tformB); %applying transform to image
O = tformB.T; %creating the X1 matrix from the tformB object

disp('Matrix using built-in function');
disp(O'); %displaying the matrix

%% Generating X1 using Self coded function
for i = 1:10
    K = [M(i,1) M(i,2) 1 0 0 0 -M(i,1)*M(i,3) -M(i,2)*M(i,3) -M(i,3); %creating the homography matrix
         0 0 0 M(i,1) M(i,2) 1 -M(i,1)*M(i,4) -M(i,2)*M(i,4) -M(i,4)];    
    output{i} = K;
end

output = cell2mat(output); %converting output to matrix from cell

[U,S,V] = svd(output,'econ'); %Computing the homogeneous solution Ax = 0 using SVD
h = V(:,9);
H = (reshape(h, 3, 3))/h(9); %dividing by last value to attain 0 at 3,3 position of transform matrix
H(1,3) = 0; %setting values at these positions to absolute zero to avoid error
H(2,3) = 0;

tform = affine2d(H); %creating tform object from matrix H
outputImage = imwarp(I, tform); %applying transform to image
imshow(outputImage);
disp('Matrix using self coded function');
disp(H');

disp('Difference between matrices'); 
disp(H' - O'); %displaying difference between matrices

%% computing mean square error
disp('Mean Square Error');
error = mean((H' - O').^2, 'all'); 
disp(error);