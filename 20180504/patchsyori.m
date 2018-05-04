%%%function
function output = patchsyori(bs)
    img = rgb2gray(bs.data);
    [x,y] = size(img);

    intImage = integralImage(img);
    avgH = integralKernel([1 1 7 7],  1/49);
    img1 = integralFilter(intImage, avgH);
    img1 = uint8(img1);
    img1 = imresize(img1, [x,y]);

    img2=imnoise(img,'gaussian',0,0.01);
        
    img1=im2double(img1);    
    [LL1, LH1, HL1, HH1] = dwt2(img1, 'haar');

    img2=im2double(img2);
    [LL2, LH2, HL2, HH2] = dwt2(img2, 'haar');

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
    alpha = 0.9;

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
    %bs.data = output;
    
    %fileName = ['\img', int2str(bs.location(1)), '_', int2str(bs.location(2)), '.jpg']; 
    %imwrite(output, fileName) 

end