
clear;
close all;
clc;

img_path_1 = 'Assign1_imgs/stereo_1.jpg';
img_path_2 = 'Assign1_imgs/stereo_2.jpg';

imObj_1 = imread(img_path_1);
imObj_2 = imread(img_path_2);
figure
imageHandle_1 = imshow(imObj_1);
% imageHandle_2 = imshow(imObj_2);
set(imageHandle_1,'ButtonDownFcn',@clickDown);
% set(imageHandle_2,'ButtonDownFcn',@clickDown);











