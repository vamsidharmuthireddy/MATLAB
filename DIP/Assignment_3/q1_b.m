% close all;
clear all;
clc;

% addr = 'Assign3_imgs/circle3.jpg';
addr = 'Assign3_imgs/rectangle2.jpg';

img = imread(addr);
img = im2double(img);
img = imgaussfilt(img,3,'FilterSize',5);
% figure,imshow(img);

[r,c,ch] = size(img);

if ch~=1
    img_gray=rgb2gray(img);
end

img_e = edge(img_gray,'canny');
% figure,imshow(img_e);

se = strel('line',10,0);
img_e2 = imclose(img_e,se);
% figure,imshow(img_e2);

img_e2 = imopen(img_e2,se);
% figure,imshow(img_e2);

se = strel('line',10,90);
img_e3 = imclose(img_e,se);
% figure,imshow(img_e3);

img_e3 = imopen(img_e3,se);
% figure,imshow(img_e3);

img_e4 = img_e3+img_e2;
% figure,imshow(img_e4);

img_e5 = edge(img_e4,'canny');
% figure,imshow(img_e5);





[H,theta,rho] = hough(img_e5,'RhoResolution',0.5,'ThetaResolution',0.5);
H_show = cast(H,'uint8');

% figure,imshow(imadjust(H_show),'XData',theta,'YData',rho,...
%     'InitialMagnification','fit');
% title('Hough transform');
% xlabel('\theta'), ylabel('\rho');
% axis on, axis normal, hold on;
% colormap(gca,hot);

peaks = houghpeaks(H,100);

lines = houghlines(img_e,theta,rho,peaks);
figure,imshow(img);
% figure,imshow(img_e5);
axis on, axis normal, hold on;
for i=1:length(lines)
    xy= [lines(i).point1;lines(i).point2];
    plot(xy(:,1),xy(:,2),'Color','r');
end


