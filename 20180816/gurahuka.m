%%% kekka matome gurahuka

clear all;


load ('P001.mat');
%PSNR1 = PSNR.';
PSNR1 = PSNR;

load ('P002.mat');
PSNR2 = PSNR;

load ('P003.mat');
PSNR3 = PSNR;

load ('P004.mat');
PSNR4 = PSNR;

load ('P005.mat');
PSNR5 = PSNR;

load ('P026.mat');
PSNR6 = PSNR;

load ('P027.mat');
PSNR7 = PSNR;

load ('P028.mat');
PSNR8 = PSNR;

load ('P029.mat');
PSNR9 = PSNR;

load ('P030.mat');
PSNR10 = PSNR;

load ('P051.mat'); 
PSNR11 = PSNR;

load ('P052.mat'); 
PSNR12 = PSNR;

load ('P053.mat'); 
PSNR13 = PSNR;

load ('P054.mat'); 
PSNR14 = PSNR;

load ('P055.mat'); 
PSNR15 = PSNR;


data = [PSNR1, PSNR6, PSNR11, PSNR2, PSNR7, PSNR12, PSNR3, PSNR8, PSNR13, PSNR4, PSNR9, PSNR14, PSNR5, PSNR10, PSNR15];
%%
group = [];
leng = 14;
for i = 1 : leng
    group(i) = 1; 
end 
for i = leng+1 : leng * 2
    group(i) = 2;
end

for i = leng * 2 + 1 : leng * 3
    group(i) = 3;
end

for i = leng * 3 + 1 : leng * 4
    group(i) = 4;
end

for i = leng * 4 + 1 : leng * 5
    group(i) = 5;
end

for i = leng * 5 + 1 : leng * 6
    group(i) = 6;
end

for i = leng * 6 + 1 : leng * 7
    group(i) = 7;
end

for i = leng * 7 + 1 : leng * 8
    group(i) = 8;
end

for i = leng * 8 + 1 : leng * 9
    group(i) = 9;
end

for i = leng * 9 + 1 : leng * 10
    group(i) = 10;
end

for i = leng * 10 + 1 : leng * 11
    group(i) = 11;
end

for i = leng * 11 + 1 : leng * 12
    group(i) = 12;
end

for i = leng * 12 + 1 : leng * 13
    group(i) = 13;
end

for i = leng * 13 + 1 : leng * 14
    group(i) = 14;
end

for i = leng * 14 + 1 : leng * 15
    group(i) = 15;
end

%group = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10];

%%
positions = [1 1.25 1.5 2 2.25 2.5 3 3.25 3.5 4 4.25 4.5 5 5.25 5.5];
boxplot(data,group, 'positions', positions);

set(gca,'xtick',[mean(positions(1:3)) mean(positions(4:6)) mean(positions(7:9)) mean(positions(10:12)) mean(positions(13:15))])
set(gca,'xticklabel',{'Direct care','Housekeeping', 'a', 'b', 'v'})

color = ['c', 'y', 'm', 'c', 'y','m','c', 'y','m','c', 'y','m','c', 'y','m'];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
   patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end

c = get(gca, 'Children');
hleg1 = legend(c(1:3), 'Feature1', 'Feature2' ,'Feature3');

%boxplot([PSNR1,PSNR2,PSNR3,PSNR4,PSNR5],'Labels',{'0.01','0.03','0.05','0.07','0.1'})

%multiple_boxplot(data',xlab,{'PSNR1', 'PSNR2', 'PSNR3', 'PSNR4', 'PSNR5'},col')
title('PSNR 0.01')


