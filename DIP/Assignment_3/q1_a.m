close all;
clear all;
clc;

% addr = 'Assign3_imgs/circle3.jpg';
addr = 'Assign3_imgs/rectangle3.jpg';

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

peaks_show = H;
theta_f = theta(peaks(:,2));
rho_f = rho(peaks(:,1));
% plot(theta_f,rho_f,'s','color','white');

% rho = a.x +b.y    x=cos(theta) y=sin(theta)


ind = find(img_e==1);
[y,x]=ind2sub(size(img_e),ind);
points_lines={};
for k=1:size(rho_f,2)
    a = round(cos(theta_f(k)));
    b = round(sin(theta_f(k)));
    c = -rho_f(k);
    p_f = [];
    for j=1:size(y,1)
        val = a*x(j) + b*y(j) + c;
        if abs(val)==0
            p_f=[p_f;[y(j),x(j),k]];
        end
    end
    points_lines{k} = p_f;
end
        
figure,imshow(img);
% figure,imshow(img_e5);
axis on, axis normal, hold on;

% plot(points_lines{1}(:,2),points_lines{1}(:,1),'s','color','red');

% line(points_lines{1}(:,2),points_lines{1}(:,1));

for i=1:size(points_lines,2)
    line(points_lines{i}(:,2),points_lines{i}(:,1));
end


