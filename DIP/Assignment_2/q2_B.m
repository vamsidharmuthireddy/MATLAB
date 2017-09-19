clear
close all;
clc

img = imread('Assign2_imgs/other_images/lighthouse.png');
% img = imread('Assign2_imgs/other_images/cameraman.tif');

% imshow(img);

img = im2double(img);

[r,c,ch] = size(img);

cutoff = 25;
cutoff = min(r/2,min(c/2,cutoff));

img_out = apply_ideal_freq(img,cutoff,'low');
figure,imshow(img_out);

img_out = apply_gauss_freq(img,cutoff,'low');
figure,imshow(img_out);

% img_out = apply_butter_freq(img,cutoff,'low');
% figure,imshow(img_out);