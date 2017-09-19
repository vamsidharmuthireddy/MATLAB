img = imread('Assign2_imgs/other_images/yellowlily.jpg');
% imshow(img);

img = im2double(img);

[r,c,ch] = size(img);

pyr_level = 3;

[gauss_pyr,lap_pyr] = get_pyramid(img,pyr_level);

for i=1:pyr_level+1
    figure,imshow(gauss_pyr{i})
end

for i=1:pyr_level+1
    figure,imshow(lap_pyr{i})
end
