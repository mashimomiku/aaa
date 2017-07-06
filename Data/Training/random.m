clear all;
close all;
clc;

%img_patch = 'Data/Training';
%img_dir = dir(fullfile(data, type));

imgfiles = dir('*.bmp');
numfiles = length(imgfiles);
mydata = cell(1, numfiles);

for i = 1:numfiles,
	  img{i} = imread(imgfiles(i).name);
end

%{
image=imread('t1.bmp');
image_gray=rgb2gray(image);
[n m]= size(image_gray); % 400 x600

L=50;

x=round(rand(1)*n); % generate a random integer between 1 and 400
y=round(rand(1)*m); % generate a random integer between 1 and 600

%verify if x is > than 400-50 , because if x is equal to 380 for example, so x+50 become %equal to 430, it exceeds the matrix dimension of image...
if(x<=n-L)
a=x:x+(L-1);
else
a=x-(L-1):x;
end

if(y<=m-L)
b=y:y+(L-1);
else
b=y-(L-1):y;
end

crop=image_gray(a,b);
figure(1);
imshow(crop);
 %}
