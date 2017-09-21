close all;
clear all;
clc;

% img = imread('Assign2_imgs/other_images/saturn.png');
img = imread('Assign2_imgs/other_images/pears.png');
img = im2double(img);
imshow(img);

[r,c,ch] = size(img);

pyr_level = 3;

[gauss_pyr,lap_pyr] = get_pyramid(img,pyr_level);

for i=1:pyr_level+1
    figure,imshow(gauss_pyr{i})
    imwrite(gauss_pyr{i},strcat('gauss_',num2str(i),'.jpg'));
end

for i=1:pyr_level+1
    figure,imshow(lap_pyr{i})
    imwrite(lap_pyr{i},strcat('lap_',num2str(i),'.jpg'));
    
    
end
