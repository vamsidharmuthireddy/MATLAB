function img_blend = blend( img1,img2,mask,level )
%BLEND Summary of this function goes here
%   Detailed explanation goes here
[r,c,ch] = size(img1);

img_blend = zeros([r,c,ch]);

[gauss_pyr1,lap_pyr1] = get_pyramid(img1,level);
[gauss_pyr2,lap_pyr2] = get_pyramid(img2,level);
[gauss_pyr3,lap_pyr3] = get_pyramid(mask,level);

% out = img1.*mask + img2.*(1-mask);
% imshow(out);

base_img = lap_pyr1{level+1}.*gauss_pyr3{level+1} + ...
                lap_pyr2{level+1}.*(1-gauss_pyr3{level+1});

% base_img = lap_pyr1{level+1};
lap_pyr_out = cell(level+1);
img_pyr_out = cell(level+1);

for i = 1:level+1
    lap_pyr_out{i} = lap_pyr1{i}.*gauss_pyr3{i} + lap_pyr2{i}.*(1-gauss_pyr3{i});
%     lap_pyr_out{i} = lap_pyr1{i};
end

img_pyr_out = lap_pyr_out;
for i=level+1:-1:2
    out = upscale(img_pyr_out{i});
    [rl,cl,chl] = size(img_pyr_out{i-1});
    out = out(1:rl,1:cl,:);
    img_pyr_out{i-1} = img_pyr_out{i-1} + out;
    
end

img_blend = img_pyr_out;

end

