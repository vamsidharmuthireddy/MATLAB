function img_blin = temp_bilin( img,scale )
%BILIN Summary of this function goes here
%   Detailed explanation goes here
[r,c,ch] = size(img);

r_n = round(scale*r);
c_n = round(scale*c);
ch_n = ch;

img_blin = zeros(r_n,c_n,ch);

for z=1:ch_n
    for x=1:c_n
        x_f = x/scale;
        for y=1:r_n
            
            x1 = max(1,floor(x_f));
            x2 = min(c,floor(x_f)+1);
            
            y_f = y/scale;
            y1 = max(1,floor(y_f));
            y2 = min(r,floor(y_f)+1);
            
            i11 = img(y1,x1,z);
            i21 = img(y1,x2,z);
            i12 = img(y2,x1,z);
            i22 = img(y2,x2,z);
            
            if y1==y2
                if y1==1
                    y1=0;
                    i11=0;
                    i21=0;
                else
                    y2=r+1;
                    i12=0;
                    i22=0;
                end
            end
            
            if x1==x2
                if x1==1
                    x1=0;
                    i11=0;
                    i12=0;
                else
                    x2=c+1;
                    i21=0;
                    i22=0;
                end
            end
            
            a = (y2-y_f)/(y2-y1);
            b = (y_f-y1)/(y2-y1);
            e = (x2-x_f)/(x2-x1);
            f = (x_f-x1)/(x2-x1);
            
            i1 = a*i11 + b*i12;
            i2 = a*i21 + b*i22;
            
            i = e*i1 + f*i2;
            
            img_blin(y,x,z) = i;
        end
    end
end



end


function i = get_linear_intensity(p1,p2,x)

m = (p1(2) - p2(2))/(p1(1) - p2(1));

c = p1(2) - m*p1(1); 

i = m*x + c;

end


