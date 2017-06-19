clear all;
close all;
clc;

for i = 1:91
    imgfiles = strcat('Data/Training/t',num2str(i),'.bmp');
    img = imread(imgfiles);
    img_gray =rgb2gray(img);
    [n m] = size(img_gray);
    
    patch_size = 8;
    
    x=round(rand(1)*n); % generate a random integer between 1 and 400
    y=round(rand(1)*m); % generate a random integer between 1 and 600
    
    %verify if x is > than 400-50 , because if x is equal to 380 for example, so x+50 become %equal to 430, it exceeds the matrix dimension of image...
   
    if(x<=n-patch_size)
        a=x:x+(patch_size-1);
        else
        a=x-(patch_size-1):x;
    end

    if(y<=m-patch_size)
        b=y:y+(patch_size-1);
        else
        b=y-(patch_size-1):y;
    end

    crop=img_gray(a,b);
    figure(1);
    %imshow(crop);
    imwrite(crop,['HD',num2str(i),'.bmp']);
end

