function bilateral_image = apply_bilateral( image,filter_size,sigma,sigma_range )
r = size(image,1);
c = size(image,2);
half_size = floor(filter_size/2);

[x,y] = meshgrid(-half_size:half_size,-half_size:half_size);
gaussian_filter = exp(-( x.^2 + y.^2 )./(2 * sigma));
gaussian_filter = (1/sum(gaussian_filter(:))).*gaussian_filter;

bilateral_image = zeros(size(image));

for ch=1:size(image,3)
    for i=1:r
        y_min = max(i-half_size,1);
        y_max = min(i+half_size,r);
        
        for j=1:c
            x_min = max(j-half_size,1);
            x_max = min(j+half_size,c);
            sub_image = image(y_min:y_max,x_min:x_max,ch);
            range_filter = exp(-((sub_image(:,:,1)-image(i,j,1)).^2)/(2*sigma_range^2));
            
            bilateral_filter = range_filter.*gaussian_filter(...
                (y_min:y_max)-i+half_size+1,(x_min:x_max)-j+half_size+1);
            
            bilateral_filter = (bilateral_filter)./sum(bilateral_filter(:));
            
            bilateral_image(i,j,ch) = sum(sum(bilateral_filter.*sub_image(:,:)));
        end
    end
end
% imshow(bilateral_image);

end

