
clear;
close all;
clc;

img_1 = imread('Assign1_imgs/hist_equal.jpg');
img_2 = imread('Assign1_imgs/hist_equal2.jpg');
img_3 = imread('Assign1_imgs/hist_equal3.jpg');
img_4 = imread('Assign1_imgs/zelda512-NoiseV400.jpg');
% hist_eq_image_1 = hist_eq(img_1);
% hist_eq_image_2 = hist_eq(img_2);
% hist_eq_image_3 = hist_eq(img_3);
% hist_eq_image_4 = hist_eq(img_4);
% 
% imwrite(hist_eq_image_1,'hist_eq_image_1.jpg');
% imwrite(hist_eq_image_2,'hist_eq_image_2.jpg');
% imwrite(hist_eq_image_3,'hist_eq_image_3.jpg');
% imwrite(hist_eq_image_4,'hist_eq_image_4.jpg');
 
match_img_1 = hist_matching(img_1,img_2);
match_img_2 = hist_matching(img_1,img_3);
match_img_3 = hist_matching(img_1,img_4);

imwrite(match_img_1,'hist_match_1.jpg');
imwrite(match_img_2,'hist_match_2.jpg');
imwrite(match_img_3,'hist_match_3.jpg');


