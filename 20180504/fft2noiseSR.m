%%% fft2 function

function output = fft2noiseSR(bs)

    %img = imread('ted2.bmp');
    %img = rgb2gray(img);
    img = rgb2gray(bs.data);
    img = im2double(img);
    [x,y] = size(img);

    intImage = integralImage(img);
    avgH = integralKernel([1 1 7 7],  1/49);
    img1 = integralFilter(intImage, avgH);
    img1 = imresize(img1, [x,y]);

    img2=imnoise(img,'gaussian',0,0.01); 

    F_img1 = fft2(img1);  %img1 fft2
    F2_img1= fftshift(F_img1);


    F_img2 = fft2(img2);
    F2_img2 = fftshift(F_img2);

    image1 = F_img1;
    image2 = F2_img1;
    image3 = F_img2;
    image4 = F2_img2;

    if rem(x,2) == 0
        tyuuoux = x/2 +1;
    else 
        tyuuoux = x/2 + 0.5;
    end

    if rem(y,2) == 0
        tyuuouy = y/2 +1;
    else 
        tyuuouy = y/2 + 0.5;
    end

    yoko = sum(F2_img1(tyuuoux,:));
    tate = sum(F2_img1(:,tyuuouy));
    naname = trace(F2_img1);
    naname2 = trace(rot90(F_img1));

    MAX = max(tate,yoko);
    MAX = max(MAX, naname);
    MAX = max(MAX, naname2);


    alpha = 0.9;
    %naname tyuusyutu
%     for i = x
%         naname_seibun(:) = F2_img1(i,i);
%     end
    hensuu1 = diag(F2_img1);
    hensuu2 = diag(F2_img2);
    hensuu3 = diag(rot90(F2_img1));
    hensuu4 = diag(rot90(F2_img2));

    if MAX == tate
        F2_img1(:,tyuuouy) = (1-alpha)*F2_img1(:,tyuuouy) + alpha*F2_img2(:,tyuuouy);
    end

    if MAX == yoko
        F2_img1(tyuuoux,:) = (1-alpha)*F2_img1(tyuuoux,:) + alpha*F2_img2(tyuuoux,:);
    end
    
    if MAX == naname
        hensuu1 = (1-alpha)*hensuu1 + alpha*hensuu2; %%
    end

    if MAX == naname2
        hensuu3 = (1-alpha)*hensuu3 + hensuu4; %%
    end 


    outputF = ifftshift(F2_img1);
    output = ifft2(outputF);

    f1 = figure;
    f2 = figure;

%     figure(f1)
%     subplot(3,2,1)
%     imagesc(uint8(abs(image1)))
%     title('blur Image')
%     subplot(3,2,2)
%     imagesc(uint8(abs(image2)))
%     title('blur Image')
%     subplot(3,2,3)
%     imagesc(uint8(abs(image3)))
%     title('Noisy Image')
%     subplot(3,2,4)
%     imagesc(uint8(abs(image4)))
%     title('Noisy Image')
%     subplot(3,2,5)
%     imagesc(uint8(abs(F_img1)))
%     title('output')
%     subplot(3,2,6)
%     imagesc(uint8(abs(fftshift(F_img1))))
%     title('output')
% 
%     figure(f2)
%     subplot(2,2,1)
%     imshow(img1)
%     title('blur Image')
%     subplot(2,2,2)
%     imshow(img2)
%     title('Noisy Image')
%     subplot(2,2,3)
%     imshow(output)
%     title('output')

end
