function out = upscale(img)
[r,c,ch] = size(img);

out = zeros([2*r, 2*c, ch]);
out(1:2:2*r,1:2:2*c,:) = img;
out = apply_gaussian(out,5,2);

% ker = generating_kernel(0.4);
% out = imfilter(out, ker, 'conv');

out = 4*out;
end