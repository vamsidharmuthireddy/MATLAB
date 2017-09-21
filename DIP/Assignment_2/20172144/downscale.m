function out = downscale(img)
[r,c,ch] = size(img);

out = apply_gaussian(img,5,1);
% out = imgaussfilt(img,1,'FilterSize',5);

out = out(1:2:r,1:2:c,:);

end