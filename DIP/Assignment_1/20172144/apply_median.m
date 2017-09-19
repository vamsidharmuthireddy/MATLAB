function median_image = apply_median( image,filter_size )
r = size(image,1);
c = size(image,2);
half_size = floor(filter_size/2);
median_image = image;

for ch=1:size(image,3)
    for i=1:r
        y_min = max(i-half_size,1);
        y_max = min(i+half_size,r);
        
        for j=1:c
            x_min = max(j-half_size,1);
            x_max = min(j+half_size,c);
            sub_image = image(y_min:y_max,x_min:x_max,ch);
            values = sort(sub_image(:));
            median = values(ceil(size(values,1)/2));
            median_image(i,j,ch) = median;

        end
    end
end

end

