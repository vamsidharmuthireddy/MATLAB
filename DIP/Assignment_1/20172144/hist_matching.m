function match_img = hist_matching( img_ref,img_target )
if size(img_ref,3)==3
    img_ref=rgb2gray(img_ref);
end
if size(img_target,3)==3
    img_target=rgb2gray(img_target);
end


cum_hist_ref = get_cum_hist(img_ref);
cum_hist_target = get_cum_hist(img_target);

mapper = zeros(256,1);
L = 2^8 ;
for i=1:size(cum_hist_target,1)
	mapper(i,1)=(L-1)*cum_hist_target(i,1);
end

match_img = zeros(size(img_ref));
[r,c,ch] = size(img_ref);
for i=1:r
    for j=1:c
        match_img(i,j)= mapper(img_ref(i,j)+1);
    end
end

match_img = cast(match_img,'uint8');


end

function cum_hist = get_cum_hist(img)
[r,c,ch] = size(img);
if ch==3
    img=rgb2gray(img);
end

flattened_image = img(:);

frequencies = zeros(256,1);
probs = zeros(256,1);
cum_hist = zeros(256,1);

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
	cum_hist(i,1)=start + probs(i,1);
	start = cum_hist(i,1);
end


end