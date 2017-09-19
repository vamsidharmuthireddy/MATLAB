close all;
clear
clc
img1 = imread('Assign2_imgs/notch_pass_reject_filter/notch1.png');
img2 = imread('Assign2_imgs/notch_pass_reject_filter/notch2.jpg');
img3 = imread('Assign2_imgs/notch_pass_reject_filter/notch3.jpg');
% 
% img1 = im2double(img1);
% figure,imshow(img1);
% cutoff1 = 10;
% img_notch1=apply_notch1(img1,cutoff1);
% figure,imshow(img_notch1);
% 
% img2 = im2double(img2);
% figure,imshow(img2);
% cutoff2 = 10;
% img_notch2=apply_notch2(img2,cutoff2);
% figure,imshow(img_notch2);
% figure,imshow(abs(img2-img_notch2))
% 
img3 = im2double(img3);
figure,imshow(img3);
cutoff3 = 16;
img_notch3=apply_notch3(img3,cutoff3);
figure,imshow(img_notch3);

figure,imshow(abs(img3-img_notch3))

