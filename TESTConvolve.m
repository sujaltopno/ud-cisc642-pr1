function [outputImg] = TESTConvolve(I,K)

figure(1);
imshow(I);
title('Input Image');

filtSiz = length(K); %width of filter

%computing the number of layers of pixels with value 0 to surround the image

layers = floor(filtSiz/2); %should be 1

I_pad = padarray(I, [layers, layers]); %padding with 0 around image

rComp = I_pad(:, :, 1); %extrating Red, Green and Blue components of the image
gComp = I_pad(:, :, 2);
bComp = I_pad(:, :, 3);

rCompNew = convolution(rComp,K,layers,filtSiz); %calling manual convulution function
rCompNew = cast(rCompNew,'like',I); %converting to uint8 form from double

gCompNew = convolution(gComp,K,layers,filtSiz); %calling manual convulution function
gCompNew = cast(gCompNew,'like',I); %converting to uint8 form from double

bCompNew = convolution(bComp,K,layers,filtSiz); %calling manual convulution function
bCompNew = cast(bCompNew,'like',I); %converting to uint8 form from double

rCompNew = rCompNew(layers:end-layers,layers:end-layers);
gCompNew = gCompNew(layers:end-layers,layers:end-layers);
bCompNew = bCompNew(layers:end-layers,layers:end-layers);

outputImg = cat(3, rCompNew, gCompNew, bCompNew); %combining the 3 components to form a single image
figure(2);
imshow(outputImg);
imwrite(outputImg,'Convolved Image.png')
title('Convolved Image');

%manual convolution function to apply to each component invidually

function  convImg  = convolution(img,kernel,layers,filtSiz)

[rows, columns] = size(img);
filteredImage = zeros(size(img)); %for creating same size filter

for col = layers + 1 : columns - layers
	for row = layers + 1 : rows - layers
		localSum = 0;
		for c = 1 : filtSiz
			ic = col + c - layers - 1;
			for r = 1 : filtSiz
				ir = row + r - layers - 1;
				localSum = localSum + double(img(ir, ic)) * kernel(r, c); %multiplying with the kernel
			end
        end
		convImg(row, col) = localSum; %applying to our input image
	end
end
end
end