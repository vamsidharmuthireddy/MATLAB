function img_expand = expand_img( img,scale )
%EXPAND_IMG Summary of this function goes here
%   Detailed explanation goes here

[r,c,ch] = size(img);

img_expand = zeros(scale*r,scale*c,ch);

for z=1:ch
    for x=1:c
        for y=1:r
            x_n = x*scale;
            y_n = y*scale;
            z_n = z;
            img_expand(y_n,x_n,z_n) = img(y,x,z);            
        end
    end
end


end

