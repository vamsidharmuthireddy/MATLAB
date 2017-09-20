function out = upscale(img)
[r,c,ch] = size(img);

out = zeros([2*r, 2*c, ch]);
out(1:2:2*r,1:2:2*c,:) = img;
out = apply_gaussian(out,5,1);

% out = imgaussfilt(out,1,'FilterSize',5);

out = 4*out;
end