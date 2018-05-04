%%%noisy image SR+denoise

clear all;

img = imread('ted.bmp');
[x,y,c] = size(img);

img_gray = rgb2gray(img);
intImage = integralImage(img_gray);
avgH = integralKernel([1 1 7 7],  1/49);
img1 = integralFilter(intImage, avgH);
img1=uint8(img1);
img1 = imresize(img1, [x,y]);

img2=imnoise(img_gray,'gaussian',0,0.01);


block = [10 10]; %8-?

%IMAGE = blockproc(img, block, @patchsyori);
IMAGE = blockproc(img, block, @fft2noiseSR);



figure
subplot(2,2,1)
imshow(img)
title('TrueImage')
subplot(2,2,2)
imshow(img1)
title('blurImage')
subplot(2,2,3)
imshow(img2)
title('NoisyImage')
subplot(2,2,4)
imshow(IMAGE)
title('output')