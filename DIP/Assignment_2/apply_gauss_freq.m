function img_gauss = apply_gauss_freq( img,cutoff,type )
%APPLY_LOW_FREQ Summary of this function goes here
%   Detailed explanation goes here
[r,c,ch] = size(img);

x0=floor(c/2);
y0=floor(r/2);

a = fft2(img);

a = fftshift(a);

fil = zeros(size(a));

for z=1:ch
    for x=1:c
        for y=1:r
            dist = ((x0-x)^2+(y0-y)^2)^0.5;
            val = exp(-dist^2/(2*cutoff^2));
            if strcmp(type,'high')
                val = 1-val;
            end
%             a(y,x,z) = a(y,x,z) *val;
            fil(y,x,z) = val;
            
        end
    end
end

a = a.*fil;

figure,imshow(a);
figure,imshow(fil);

a = ifftshift(a);
img_gauss = ifft2(a);





end

