close all;
clear;
clc;

img = imread('Assign1_imgs/bell.jpg');

rho = 10;
rmax = 250;
spherical_image = spherical(img,rho,rmax);
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(spherical_image);

img = imread('Assign1_imgs/bell.jpg');
imwrite(spherical_image,['spherical_',int2str(rho),'.jpg']);


aX = 10;
aY = 15;
tX = 180;
tY = 250;

% ripple_image = ripple(A,aX,aY,tX,tY);
% imshow(ripple_image);
% imwrite(ripple_image,['ripple_',int2str(tX),'_',int2str(tY),'_',int2str(aX),'_',int2str(aY),'.jpg']);
