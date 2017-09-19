function result = apply_gaussian(image,filter_size,sigma)

[x,y] = meshgrid(-filter_size:filter_size,-filter_size:filter_size);
gauusian_filter = exp(-( x.^2 + y.^2 )./(2 * sigma));
gauusian_filter = (1/sum(gauusian_filter(:))).*gauusian_filter;

result = imfilter(image,gauusian_filter);

end



