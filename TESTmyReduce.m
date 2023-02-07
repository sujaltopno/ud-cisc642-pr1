%CISC642
%Sujal Amrit Topno

function [outputImage] = TESTmyReduce(I) %to test the reduce function

figure(1);
imshow(I); %displaying actual image
title('Input Image');
fprintf('Size of Input Image');
size(I)

scale = [0.5 0.5]; %scale factor for scaling image [x y] (currently set at half)
oldSize = size(I); %getting the current size of the image 
newSize = max(floor(scale.*oldSize(1:2)),1); %calculating the new size of the image

rowCount = min(round(((1:newSize(1))-0.5)./scale(1)+0.5),oldSize(1)); %applying nearest neighbour interplation (counting rows)
colCount = min(round(((1:newSize(2))-0.5)./scale(2)+0.5),oldSize(2)); %counting columns

outputImage = I(rowCount,colCount,:); %Index old image to get new image

figure(2);
imshow(outputImage); %displaying scaled up image
imwrite(outputImage,'Reduced Image.png'); %writing to file scaled up image
title('Reduced Image');
fprintf('Size of Output Image');
size(outputImage)

end