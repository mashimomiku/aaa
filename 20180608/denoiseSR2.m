%%%noisy image SR+denoise 0607

% clear all;
% 
% input = imread('ted.bmp');
% input2 = im2double(input);
% 
% [x,y,C] = size(input2);
% if C == 3
%     im_ycbcr = rgb2ycbcr(input2);
% else
%     im_ycbcr = input2;
% end
% img = im_ycbcr(:,:,1);
% 
% img_1 = rgb2gray(input);  %%int
% 
% intImage = integralImage(img_1);
% avgH = integralKernel([1 1 7 7],  1/49);
% img1 = integralFilter(intImage, avgH);
% img1=uint8(img1);
% img1 = imresize(img1, [x,y]);
% 
% img2=imnoise(img,'gaussian',0,0.01);

%%
clear all;

input1 = imread('deno.bmp'); %%blur
input2 = im2double(imread('SR.bmp')); %%SR

[x,y,C] = size(input1);
if C == 3
    im_ycbcr_1 = rgb2ycbcr(input1);
else
    im_ycbcr_1 = input1;
end
img1 = im_ycbcr_1(:,:,1);

[x2,y2,C2] = size(input2);
if C2 == 3
    im_ycbcr_2 = rgb2ycbcr(input2);
else
    im_ycbcr_2 = input2;
end
img2 = im_ycbcr_2(:,:,1);

%%
patch_size = 10;
max_xpatch = x/patch_size;
max_xpatch = fix(max_xpatch);
amari_xpatch = mod(x, patch_size);

max_ypatch = y/patch_size;
max_ypatch = fix(max_ypatch);
amari_ypatch = mod(y, patch_size);

x_0 = 1;
y_0 = 1;
x_end = patch_size-1;
y_end = patch_size-1;



for i = 1:max_xpatch
    for j = 1:max_ypatch
        
        img1_mini = imcrop(img1, [x_0 y_0 x_end y_end]);
        img2_mini = imcrop(img2, [x_0 y_0 x_end y_end]);
        
        img1_mini=im2double(img1_mini);
        [LL1, LH1, HL1, HH1] = dwt2(img1_mini, 'haar');

        img2_mini=im2double(img2_mini);
        [LL2, LH2, HL2, HH2] = dwt2(img2_mini, 'haar');

        %LL_diff = imfuse(LL1, LL2, 'diff');
        LH_diff = imabsdiff(LH1, LH2);
        HL_diff = imabsdiff(HL1, HL2);
        HH_diff = imabsdiff(HH1, HH2);

        LH_ookisa = integralImage(LH_diff);
        [x,y] = size(LH_ookisa);
        LH_ookisa2 = LH_ookisa(x,y); 

        HL_ookisa = integralImage(HL_diff);
        HL_ookisa2 = HL_ookisa(x,y); 

        HH_ookisa = integralImage(HH_diff);
        HH_ookisa2 = HH_ookisa(x,y); 

        MAX = max(LH_ookisa2, HL_ookisa2);
        MAX = max(MAX, HH_ookisa2);
        
        LL = LL1;
        alpha = 0.5;

        if MAX == LH_ookisa2
            LH = (1-alpha)*LH1 + alpha*LH2;
            %LH = im2double(LH);
            HL = HL1;
            HH = HH1;
        end

        if MAX == HL_ookisa2
            %HL = imfuse(HL1,HL2);
            HL = (1-alpha)*HL1 + alpha*HL2;
            %HL = rgb2gray(HL);
            %HL = im2double(HL);
            LH = LH1;
            HH = HH1;
        end

        if MAX == HH_ookisa2
            %HH = imfuse(HH1,HH2);
            HH = (1-alpha)*HH1 + alpha*HH2;
            %HH = rgb2gray(HH);
            %HH = im2double(HH);
            HL = HL1;
            LH = LH1;
        end
        
        output = idwt2(LL, LH, HL, HH, 'haar');
        kekka(:,:,i,j) = output;
        
        %output2 = +output;
        y_0 = y_0 + patch_size;
        %y_end = y_end + patch_size;
        
    end
    y_0 = 1;
    x_0 = x_0 + patch_size;
    %x_end = x_end + patch_size;
end    

IMAGE = kekka(:,:,1,1);
for J = 2:j
    IMAGE = [IMAGE;kekka(:,:,1,J)];
end
IMAGE2 = IMAGE;

for I = 2:i
    IMAGE = kekka(:,:,I,1);
    for J = 2:j
        IMAGE = [IMAGE;kekka(:,:,I,J)];
    end
    IMAGE2 = [IMAGE2,IMAGE]; 
end
%%
% IMAGE2 = IMAGE2 * 255;
% if C == 3
%     im_ycbcr(:,:,1) = IMAGE2 / 255.0;
%     IMAGE3  = ycbcr2rgb(im_ycbcr) * 255.0;
% else
%     IMAGE3 = IMAGE2;
% end

%%
IMAGE2 = IMAGE2 * 255;
if C == 3
    im_ycbcr_2(:,:,1) = IMAGE2 / 255.0;
    IMAGE3  = ycbcr2rgb(im_ycbcr_2) * 255.0;
else
    IMAGE3 = IMAGE2;
end
%%

figure
subplot(2,2,1)
imshow(img1)
title('blurImage')
subplot(2,2,2)
imshow(img2)
title('noisyImage')
subplot(2,2,3)
imshow(uint8(IMAGE3))
