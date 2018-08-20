%%% kekka matome gurahuka

clear all;

% SR+deno
load ('P021.mat');
%PSNR1 = PSNR.';
PSNR1 = PSNR;

load ('P022.mat');
PSNR2 = PSNR;

load ('P023.mat');
PSNR3 = PSNR;

load ('P024.mat');
PSNR4 = PSNR;

load ('P025.mat');
PSNR5 = PSNR;

%deno-SR
load ('P046.mat');
PSNR6 = PSNR;

load ('P047.mat');
PSNR7 = PSNR;

load ('P048.mat');
PSNR8 = PSNR;

load ('P049.mat');
PSNR9 = PSNR;

load ('P050.mat');
PSNR10 = PSNR;


%SR-deno
load ('P071.mat'); 
PSNR11 = PSNR;

load ('P072.mat'); 
PSNR12 = PSNR;

load ('P073.mat'); 
PSNR13 = PSNR;

load ('P074.mat'); 
PSNR14 = PSNR;

load ('P075.mat'); 
PSNR15 = PSNR;


% bicubic
load ('BP01.mat');
PSNR16 = PSNR;

load ('BP02.mat');
PSNR17 = PSNR;

load ('BP03.mat');
PSNR18 = PSNR;

load ('BP04.mat');
PSNR19 = PSNR;

load ('BP05.mat');
PSNR20 = PSNR;


%PSNR6 =  ones(1,14); %%
data = [PSNR1, PSNR6, PSNR11, PSNR16, PSNR2, PSNR7, PSNR12, PSNR17, PSNR3, PSNR8, PSNR13, PSNR18, PSNR4, PSNR9, PSNR14, PSNR19, PSNR5, PSNR10, PSNR15, PSNR20];
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

for i = leng * 15 + 1 : leng * 16
    group(i) = 16;
end

for i = leng * 16 + 1 : leng * 17
    group(i) = 17;
end

for i = leng * 17 + 1 : leng * 18
    group(i) = 18;
end

for i = leng * 18 + 1 : leng * 19
    group(i) = 19;
end

for i = leng * 19 + 1 : leng * 20
    group(i) = 20;
end
%group = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10];

%%
%positions = [1 1.25 1.5 1.75 2 2.25 2.5 2.75 3 3.25 3.5 3.75 4 4.25 4.5 4.75 5 5.25 5.5 5.75];
positions = [1 1.25 1.5 1.75 2.25 2.5 2.75 3 3.5 3.75 4 4.25 4.75 5 5.25 5.5 6. 6.25 6.5 6.75];
boxplot(data,group, 'positions', positions);

set(gca,'xtick',[mean(positions(1:4)) mean(positions(5:8)) mean(positions(9:12)) mean(positions(13:16)) mean(positions(17:20))])
set(gca,'xticklabel',{'0.01','0.03', '0.05', '0.07', '0.1'})

% color nazeka gyaku
color = ['c', 'y', 'm', 'r', 'c', 'y','m','r','c', 'y','m','r','c', 'y','m','r','c', 'y','m', 'r'];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
   patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end

c = get(gca, 'Children');
hleg1 = legend(c(1:4), 'SR + denoise', 'denoise →　SR' ,'SR → denoise','Bicubic');

xlabel('noise variance')
ylabel('PSNR[dB]')
title('PSNR 0.1 learning')


