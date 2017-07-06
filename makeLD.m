clear all;
close all;
clc;

for i = 1:91
    imgfiles = strcat('HD/HD',num2str(i),'.bmp');
    img = imread(imgfiles);
    [n m] = size(img);
    
    Limg = imresize(img, 0.5);
    Limg2 = imresize(Limg, 2);
    
    figure(1);
    imshow(Limg2);
    imwrite(Limg2,['LD',num2str(i),'.bmp']);
end

