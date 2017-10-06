clear;
clc;
close all;
img = imread('Assign2_imgs/other_images/onion.png');
% imshow(img);

img = im2double(img);

[r,c,ch] = size(img);


scale = 5;

r_n = round(scale*r);
c_n = round(scale*c);
ch_n = ch;



img_nn = nn(img,scale);
figure,imshow(img_nn);
imwrite(img_nn,strcat('upscale_nn',num2str(1),'.jpg'));

img_lin = lin(img,scale,'col');
img_lin = lin(img_lin,scale,'row');
figure,imshow(img_lin)
imwrite(img_lin,strcat('upscale_lin',num2str(1),'.jpg'));

img_bilin = bilin(img,scale);
figure,imshow(img_bilin)
imwrite(img_bilin,strcat('upscale_bilin',num2str(1),'.jpg'));

% a = imresize(img,scale,'bicubic');
% figure,imshow(a);


img_bicub = bicub(img,scale);
figure,imshow(img_bicub);
imwrite(img_bicub,strcat('upscale_bicub',num2str(1),'.jpg'));
