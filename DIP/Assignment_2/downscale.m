function out = downscale(img)
[r,c,ch] = size(img);
out = apply_gaussian(img,5,2);
out = out(1:2:r,1:2:c,:);

end