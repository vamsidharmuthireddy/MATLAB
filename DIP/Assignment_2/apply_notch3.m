function img_notch = apply_notch3( img,cutoff )
%APPLY_NOTCH1 Summary of this function goes here
%   Detailed explanation goes here
[r,c,ch] = size(img);

x0=floor(c/2);
y0=floor(r/2);

a = fft2(img);

a = fftshift(a);
figure,imshow(a);
fil = zeros(size(a));

x1 = 80; y1=128;
x2 = 176; y2=128;
x3 = 150; y3=178;
x4 = 186; y4=178;


for z=1:ch
    for x=1:c
        for y=1:r
            dist = ((x0-x)^2+(y0-y)^2)^0.5;
            dist1 = ((x1-x)^2+(y1-y)^2)^0.5;
            dist2 = ((x2-x)^2+(y2-y)^2)^0.5;
            dist3 = ((x3-x)^2+(y3-y)^2)^0.5;
            dist4 = ((x4-x)^2+(y4-y)^2)^0.5;
            
            if dist >=16 && ( (y<(r/2 + 5) && y>(r/2 - 5)) || (x<(c/2 + 5) && x>(c/2 - 5)) )
                val = 0;
            else
                val=1;
            end

%             if (14<dist && dist<42) || (37<dist && dist<66) || (77<dist && dist<106) || (66<dist && dist<95)
%                 val = 0;
%             else
%                 val = 1;
%             end

            fil(y,x,z) = val;
            
        end
    end
end

a = a.*fil;

figure,imshow(fil);
% figure,imshow(a);
a = ifftshift(a);
img_notch = ifft2(a);

end

