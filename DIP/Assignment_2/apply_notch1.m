function img_notch = apply_notch1( img,cutoff )
%APPLY_NOTCH1 Summary of this function goes here
%   Detailed explanation goes here
[r,c,ch] = size(img);

x0=floor(c/2);
y0=floor(r/2);

a = fft2(img);

a = fftshift(a);
figure,imshow(a);
fil = zeros(size(a));

x1 = 136; y1=80;
x2 = 172; y2=80;
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
            
            if (dist1 < cutoff || dist2 < cutoff || dist3 < cutoff || dist4 < cutoff)...
                    || (dist >=25 && (x<(c/2 + 2) && x>=(c/2 - 2)) )...
                    || ((y < y1+2) && (y > y1-2)) || ((y < y3+2) && (y > y3-2))...
                    || (y<r/2 && (((x < x1+2) && (x >= x1-2)) || ((x < x2+2) && (x >= x2-2))))...
                    || (y>=r/2 && (((x < x3+2) && (x >= x3-2)) || ((x < x4+2) && (x >= x4-2))))
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

% figure,imshow(fil);
figure,imshow(a);
a = ifftshift(a);
img_notch = ifft2(a);

end

