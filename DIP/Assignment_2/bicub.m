function img_bicub = bicub( img,scale )
%BICUB Summary of this function goes here
%   Detailed explanation goes here
[r,c,ch] = size(img);

r_n = round(scale*r);
c_n = round(scale*c);
ch_n = ch;

img_bicub = zeros(r_n,c_n,ch);

for z=1:ch_n
    for x=1:c_n
        x_f = x/scale;
        for y=1:r_n
            
            x1 = max(1,floor(x_f));
            x2 = min(c,floor(x_f)+1);
            
            x0 = max(1,x1-1);
            x3 = min(c,x2+1);
            
            y_f = y/scale;
            y1 = max(1,floor(y_f));
            y2 = min(r,floor(y_f)+1);
            
            y0 = max(1,y1-1);
            y3 = min(r,y2+1);
            
            i00 = img(y0,x0,z); i01 = img(y1,x0,z);
            i02 = img(y2,x0,z); i03 = img(y3,x0,z);
            
            i10 = img(y0,x1,z); i11 = img(y1,x1,z);
            i12 = img(y2,x1,z); i13 = img(y3,x1,z);
            
            i20 = img(y0,x2,z); i21 = img(y1,x2,z);
            i22 = img(y2,x2,z); i23 = img(y3,x2,z);
            
            i30 = img(y0,x3,z); i31 = img(y1,x3,z);
            i32 = img(y2,x3,z); i33 = img(y3,x3,z);
            
            i0 = [i00,i01,i02,i03];
            i1 = [i10,i11,i12,i13];
            i2 = [i20,i21,i22,i23];
            i3 = [i30,i31,i32,i33];
            
            val0 = cubic(i0,y_f);
            val1 = cubic(i1,y_f);
            val2 = cubic(i2,y_f);
            val3 = cubic(i3,y_f);
            
            i4 = [val0,val1,val2,val3];
            
            i = cubic(i4,x_f);
            
                        
            img_bicub(y,x,z) = i;
        end
    end
end


end

function value = cubic(i,x)

a = -0.5*i(1) + 1.5*i(2) - 1.5*i(3) + 0.5*i(4);
b = i(1) - 2.5*i(2) + 2*i(3) - 0.5*i(4);
c = -0.5*i(1) + 0.5*i(3);
d = i(2);

% a = i(1) + i(2) - i(3) + i(4);
% b = i(1) - i(2) + i(3) - i(4);
% c = -i(1) + i(3);
% d = i(2);

x = x-floor(x);

value =   a*(x^3) + b*(x^2) + c*(x) + d;

end