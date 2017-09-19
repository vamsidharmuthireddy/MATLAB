function img_high = apply_high_freq( img,cutoff )
%APPLY_LOW_FREQ Summary of this function goes here
%   Detailed explanation goes here
[r,c,ch] = size(img);

x0=floor(c/2);
y0=floor(r/2);

a = fft2(img);

a = fftshift(a);

for z=1:ch
    for x=1:c
        for y=1:r
            dist = ((x0-x)^2+(y0-y)^2)^0.5;
            if dist <= cutoff
                a(y,x,z) = 0;
            end
            
        end
    end
end
figure,imshow(a);

a = ifftshift(a);
img_high = ifft2(a);





end

