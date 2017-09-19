function img_laplacian = apply_laplacian_freq( img,cutoff )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[r,c,ch] = size(img);

x0=floor(c/2);
y0=floor(r/2);

img_f = fft2(img);
img_f = fftshift(img_f);

fil = zeros(size(img_f));

for z=1:ch
    for x=1:c
        for y=1:r
            dist = ((x0-x)^2+(y0-y)^2)^0.5;
            coeff = ((x0-x)^2 + (y0-y)^2 - 2*cutoff^2)/cutoff^4;
            val = coeff * exp(-dist^2/(2*cutoff^2));
            
            fil(y,x,z) = val;
            
        end
    end
end

figure,imshow(fil);

img_f = img_f .*fil;

img_laplacian = ifftshift(img_f);
img_laplacian = ifft2(img_laplacian);

end

