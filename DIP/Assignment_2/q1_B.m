clear;
clc;
close all;

adrs1 = 'Assign2_imgs/image_blending_with_laplacian_pyramid/example1/im1.jpg';
adrs2 = 'Assign2_imgs/image_blending_with_laplacian_pyramid/example1/im2.jpg';
adrs3 = 'Assign2_imgs/image_blending_with_laplacian_pyramid/example1/mask.jpg';

img1 = imread(adrs1);   %foreground....object of interest
img1 = im2double(img1); %background....background of interest
[r,c,ch] = size(img1);
% figure,imshow(img1);

img2 = imread(adrs2);
img2 = im2double(img2);
% figure,imshow(img2);

mask_base = imread(adrs3);
mask_base = im2double(mask_base);
mask(:,:,1) = mask_base;
mask(:,:,2) = mask_base;
mask(:,:,3) = mask_base;

min_size = min([r, c]);
pyr_level = floor(log(min_size) / log(2)) - 4;
% pyr_level = 4;

img_blend = blend(img1,img2,mask,pyr_level);
for i=1:pyr_level+1
    figure,imshow(img_blend{i});
    imwrite(img_blend{i},strcat('blend_',num2str(i),'.jpg'));
end
img_out = img_blend{1};
% figure,imshow(img_out);

