function hist_eq_image = hist_eq( input_image )

[r,c,ch] = size(input_image);
if ch==3
    input_image=rgb2gray(input_image);
end

flattened_image = input_image(:);

frequencies = zeros(256,1);
probs = zeros(256,1);
cumm_probs = zeros(256,1);
mapper = zeros(256,1);

L = 2^8 ;
n = size(flattened_image,1);

for i=1:size(flattened_image,1)
    value = flattened_image(i) + 1;
    if frequencies(value,1) ~= 0
		frequencies(value,1) = frequencies(value,1) + 1;
    else
		frequencies(value,1) = 1;
    end
end

probs=frequencies./n;

start = 0;
for i =1:size(probs,1)
	cumm_probs(i,1)=start + probs(i,1);
	start = cumm_probs(i,1);
end

for i=1:size(cumm_probs,1)
	mapper(i,1)=(L-1)*cumm_probs(i,1);
end
% figure,plot(probs);
% figure,plot(cumm_probs);

hist_eq_image = zeros(size(input_image));

for i=1:r
    for j=1:c
        hist_eq_image(i,j)= mapper(input_image(i,j)+1);
    end
end

hist_eq_image = cast(hist_eq_image,'uint8');

end

