close all;
clear all;
clc;

RGB = imread('gantrycrane.png');
I  = im2double(rgb2gray(RGB));
BW = edge(I,'canny');

% [H,T,R] = hough(BW,'RhoResolution',0.5,'ThetaResolution',0.5);
[H,T,R] = hough(BW);
H = cast(H,'uint8');

subplot(2,1,1);
imshow(RGB);
title('gantrycrane.png');
subplot(2,1,2);
imshow(imadjust(H),'XData',T,'YData',R,...
      'InitialMagnification','fit');
title('Hough transform of gantrycrane.png');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(gca,hot);










