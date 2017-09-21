close all;
clear all;

img = imread('Assign2_imgs/other_images/saturn.png');
% imshow(img);

img = im2double(img);
img = imresize(img,[1024,1024]);

[r,c,ch] = size(img);

y_o = 1:2:r;
y_e = 2:2:r;

% img_1 = img(x_o,y_o);
% img_2 = img(x_o,y_e);
% img_3 = img(x_e,y_o);
% img_4 = img(x_e,y_e);

img_fft_1 = zeros(size(img));
img_fft = zeros(size(img));


for z=1:ch
    for y=1:r
        fx= img(y,:,z);
        val = apply_fft(fx);
        img_fft_1(y,:,z) = val;

    end
end

figure,imshow(img_fft_1./abs(img_fft_1));

for z=1:ch
    for x=1:c
        fy= img_fft_1(:,x,z);
        val = apply_fft(fy);
        img_fft(:,x,z) = val;

    end
end

figure,imshow(img_fft./abs(img_fft));

