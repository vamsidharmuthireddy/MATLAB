function [gauss_pyr,lap_pyr] = get_pyramid( img,level )
%GET_PYRAMID Summary of this function goes here
%   Detailed explanation goes here

gauss_pyr=cell(level+1);
gauss_pyr{1} = img;
out = img;
for l=2:level+1
    out = downscale(out);
    gauss_pyr{l} = out;
    
end

lap_pyr=cell(level+1);
for l=1:level
    out = upscale(gauss_pyr{l+1});
%     figure,imshow(out);
    
    [r_p,c_p,ch_p] = size(gauss_pyr{l});
    out=out(1:r_p,1:c_p,:);
    
    lap_pyr{l} = gauss_pyr{l}-out;
    
end

lap_pyr{level+1} = gauss_pyr{level+1};


end





