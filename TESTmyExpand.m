%CISC642
%Sujal Amrit Topno

function [outputImage] = TESTmyExpand(I) %expand function

%I = imread('lena.png'); %taking input at image

%displaying actual image
figure(1);
imshow(I);
title('Input Image');
fprintf('Size of Input Image');
size(I) %computing size of input image

scale = [2 2]; %scale factor for scaling image [x y] (currently set at double)
oldSize = size(I); %getting the current size of the image 
newSize = max(floor(scale.*oldSize(1:2)),1); %calculating the new size of the image

rowCount = min(round(((1:newSize(1))-2)./scale(1)+2),oldSize(1)); %applying nearest neighbour interplation (counting rows)
colCount = min(round(((1:newSize(2))-2)./scale(2)+2),oldSize(2)); %counting columns

outputImage = I(rowCount,colCount,:); %storing output image

figure(2);
imshow(outputImage); %displaying scaled up image
imwrite(outputImage,'Expanded Image.png'); %writing to file scaled up image
title('Expanded Image');
fprintf('Size of Output Image');
size(outputImage) %computing size of output image

end