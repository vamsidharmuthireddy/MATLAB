function highboost_image = apply_highboost( image,filter_size,lambda )

mean_image = get_mean_image(image,filter_size);
diff_image = image - mean_image;

highboost_image = image+lambda .* diff_image;

end

function mean_image = get_mean_image(image,filter_size)
r = size(image,1);
c = size(image,2);
half_size = floor(filter_size/2);
mean_image = image;

for ch=1:size(image,3)
    for i=1+half_size:r-half_size
        for j=1+half_size:c-half_size
            sub_image = image(i-half_size:i+half_size,j-half_size:j+half_size,ch);
            mean = ( sum(sub_image(:)) )/(size(sub_image(:),1));
            mean_image(i,j,ch) = mean;

        end
    end
end

end

