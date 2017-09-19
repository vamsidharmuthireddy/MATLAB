img = imread('Assign2_imgs/other_images/saturn.png');
% img = imread('Assign2_imgs/other_images/cameraman.tif');

imshow(img);

img = im2double(img);

[r,c,ch] = size(img);

cutoff = 1;
cutoff = min(r/2,min(c/2,cutoff));

img_laplacian = apply_laplacian_freq(img,cutoff);
figure,imshow(img_laplacian);

% for z=1:ch
%     img_f(:,:,z) = fft2(img(:,:,z));
%     img_f(:,:,z) = fftshift(img_f(:,:,z));
% end
% 
% temp = fft2(img);
% temp = fftshift(temp);
% 
% figure,imshow(img_f);
% figure,imshow(temp);
% 
% figure,imshow(abs(img_f-temp));
