
clc;
close all;
clc;
clear;
%%  This Matlab file demomstrates an IR image enhancement algorithm based on Yu Wang et al's paper:

% E-mail: yurowang@163.com
% For paper:Enhancing infrared imaging systems with temperature-dependent nonuniformity correction via single-frame and inter-frame structural similarity
% Author: Yu Wang, all rights reserved


for j=1


%% real data 
    I2=im2double(imread('G:\论文4\paper3demo\PIC\1.bmp'));
    I3=im2double(imread('G:\论文4\paper3demo\PIC\2.bmp'));
    I4=im2double(imread('G:\论文4\paper3demo\PIC\3.bmp'));
    I5=im2double(imread('G:\论文4\paper3demo\PIC\4.bmp'));


fx = [1, -1];
fy = [1; -1]; 
dx=imfilter(I2,fx,'replicate');
dy=imfilter(I2,fy,'replicate');
dim=mat2gray(sqrt(dx.^2+dy.^2));
K=12; %Number of iterations
% optional
c1=0.0005;
c2=0.9995;
flag=1;
%solver
[D4,B4] = SISBNUC(I2,(I5),(I4),(I3),dim,flag,K,c1,c2); 






%% 显示

subplot(1,3,1)
imshow(I2,[])
subplot(1,3,2)
imshow(B4,[])

subplot(1,3,3)
imshow(D4,[])


OUT=(B4) ;

      fid2 = strcat('G:\论文3投出资料\重投\',num2str(j),'.png'); 
% imwrite(mat2gray(D4),fid2);




    title(j)


end








