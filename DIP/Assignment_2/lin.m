function img_lin = lin( img, scale, scale_type )
%LIN Summary of this function goes here
%   Detailed explanation goes here
[r,c,ch] = size(img);
if strcmp(scale_type,'row')
    img_lin = zeros(round(scale*r),c,ch);
else
    img_lin = zeros(r,round(scale*c),ch);
end


[r_n,c_n,ch_n] = size(img_lin);

for z=1:ch_n
    for x=1:c_n
        x_f = x/scale;
        for y=1:r_n
            y_f = y/scale;
            if strcmp(scale_type,'row')
                y0 = floor(y/scale);
                
                if y0==0
                    i0 = 1/256;
%                     y0 = 1;
                else
                    i0 = img(y0,x,z);
                end
                
                if y0==r
                    i = img(y0,x,z);
                else
                    y1 = min(r,(y0 + 1));
                    i1 = img(y1,x,z);
%                     p0 = [y0*scale , i0];
%                     p1 = [y1*scale , i1];
                    p0 = [y0 , i0];
                    p1 = [y1 , i1];
                    i = get_linear_intensity(p0,p1,y_f);
                end
                
            else
                x0 = floor(x/scale);
                
                if x0==0
                    i0 = 1/256;
%                     x0 = 1;
                else
                    i0 = img(y,x0,z);
                end
                
                if x0==c
                    i = img(y,x0,z);
                else
                    x1 = min(c,(x0 + 1));
                    i1 = img(y,x1,z);
%                     p0 = [x0*scale,i0];
%                     p1 = [x1*scale,i1];
                    p0 = [x0,i0];
                    p1 = [x1,i1];
                    i = get_linear_intensity(p0,p1,x_f);
                end
                
            end
            
            img_lin(y,x,z) = i;            
        end
    end
end



end


function i = get_linear_intensity(p1,p2,x)

m = (p1(2) - p2(2))/(p1(1) - p2(1));

c = p1(2) - m*p1(1); 

i = m*x + c;

end


