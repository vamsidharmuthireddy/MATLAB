function result = apply_gaussian(image,filter_size,sigma)

half_size = floor(filter_size/2);

[x,y] = meshgrid(-half_size:half_size,-half_size:half_size);
gaussian_filter = exp(-( x.^2 + y.^2 )./(2 * sigma));
gaussian_filter = (1/sum(gaussian_filter(:))).*gaussian_filter;

result = conv_filter(image,gaussian_filter);

end

function result = conv_filter(img,filter,filter_size)
[r,c,ch] = size(img);

half_size = floor(filter_size/2);

result = zeros([r,c,ch]);

for z=1:ch
    for x=1:c
        x_min = x-half_size;
        x_max = x+half_size;
        for y=1:r
            y_min = max(y-half_size,1);
            y_max = min(y+half_size,r);
            
            img_sub = zeros([2*half_size+1,2*half_size+1]);
            xx=1;yy=1;
            for j=x_min:x_max
                for k=y_min:y_max
                    
                    if j<1 || k<1
                        img_sub(yy,xx)=0;
                    elseif j>c || k>r
                        img_sub(yy,xx)=0;
                    else
                        img_sub(yy,xx)=img(k,j,ch);
                    end
                    yy = yy+1;
                end
                xx=xx+1;
            end
            
            sub_conv = img_sub.*filter;
            
            result(y,x,z) = sum(sub_conv(:));
            
        end
    end
end



end

