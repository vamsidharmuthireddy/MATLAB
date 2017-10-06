close all;
clear all;
clc;

% addr = 'Assign3_imgs/circle3.jpg';
addr = 'Assign3_imgs/rectangle3.jpg';

img = imread(addr);
img = im2double(img);
% figure,imshow(img);

[r,c,ch] = size(img);

if ch~=1
    img=rgb2gray(img);
end

img_e = edge(img,'canny');
figure,imshow(img_e);

[H,theta,rho] = hough(img_e,'RhoResolution',0.5,'ThetaResolution',0.5);
H_show = cast(H,'uint8');

figure,imshow(imadjust(H_show),'XData',theta,'YData',rho,...
    'InitialMagnification','fit');
title('Hough transform');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
% colormap(gca,hot);

peaks = houghpeaks(H,100);

peaks_show = H;
theta_f = theta(peaks(:,2));
rho_f = rho(peaks(:,1));
plot(theta_f,rho_f,'s','color','white');

% rho = a.x +b.y    x=cos(theta) y=sin(theta)

rho_f = rho_f(1);
theta_f = theta_f(1);

ind = find(img_e==1);
[y,x]=ind2sub(size(img_e),ind);
p_f = [];
for k=1:size(rho_f,1)
    for l=1:size(theta_f,1)
        a = cos(theta_f(l));
        b = sin(theta_f(l));
        rh = rho_f(k);
        for j=1:size(y,1)
            for i=1:size(x,1)
                val = a*x(i) + b*y(j) - rh;
                if abs(val)<=0.1
                    p_f=[p_f;[y(j),x(i)]];
                end
            end
        end
    end
end
        








