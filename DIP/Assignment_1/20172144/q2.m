
clear;
close all;
clc;

% input_image = imread('Assign1_imgs/pea1.bmp');
input_image =double(imread('Assign1_imgs/portraits2.jpg'))./255;

filter_sizes = [8,5,3];
for filter_size=filter_sizes
    gaussian_sigmas=[2,5,10];
    for gaussian_sigma = gaussian_sigmas
%         gaussian_sigma = 2;
        gaussian_image=apply_gaussian(input_image,filter_size,gaussian_sigma);
%         subplot(3,3,1);
%         imshow(input_image);
%         subplot(3,3,2)
%         imshow(gaussian_image);
    end
end
imwrite(gaussian_image,'gaussian_blur.jpg');

input_image =double(imread('Assign1_imgs/SaltPepperNoise.jpg'))./255;
% filter_size = 3;
for filter_size=filter_sizes
    median_image = apply_median(input_image,filter_size);
%     subplot(3,3,3)
%     imshow(median_image);
end
imwrite(median_image,'median_blur.jpg');

input_image =double(imread('Assign1_imgs/blur2.jpg'))./255;
% % filter_size = 3;
for filter_size=filter_sizes
    lambdas = [5,10,15];
    for lambda=lambdas
%         lambda = 5;
        highboost_image = apply_highboost(input_image,filter_size,lambda);
%         subplot(3,3,4)
%         imshow(highboost_image);
    end
end
imwrite(highboost_image,'highboost.jpg');

input_image =double(imread('Assign1_imgs/portraits2.jpg'))./255;
% filter_size = 3;
gaussian_sigma = 8;
for filter_size=filter_sizes
    sigma_rs = [10,20,30];
%     sigma_rs=90;
    for sigma_r=sigma_rs
%         sigma_r = 90;
        bilateral_image = apply_bilateral(input_image,filter_size,gaussian_sigma,sigma_r);
%         subplot(3,3,5)
%         imshow(bilateral_image);
    end
end
imwrite(gaussian_image,'bilateral_blur.jpg');