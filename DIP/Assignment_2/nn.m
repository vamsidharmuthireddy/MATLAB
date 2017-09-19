function img_nn = nn( img, scale )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[r,c,ch] = size(img);
img_nn = zeros(scale*r,scale*c,ch);

% img_nn = expand_img(img,scale);

del_0 = ceil(scale/2);
del_1 = floor(scale/2);

for z=1:ch
    for x=1:c
        x_n0 = x*scale - del_0;
        x_n1 = x*scale + del_1;
        if x==1
            x_n0 = 1;
        end
        for y=1:r
            y_n0 = y*scale - del_0;
            y_n1 = y*scale + del_1;
            if y==1
                y_n0 = 1;
            end
            
            img_nn(y_n0:y_n1,x_n0:x_n1,z) = img(y,x,z);            
        end
    end
end


end

