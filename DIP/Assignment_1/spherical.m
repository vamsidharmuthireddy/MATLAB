function spherical_img = spherical(img,rho,rMax)
row = size(img,1);
col = size(img,2);

xC = round(col/2);
yC = round(row/2);

imshow(img);
% rMax = min([xC,yC,rMax]);

spherical_img = zeros(size(img),'uint8');
% spherical_img = img;

for ch = 1:size(img,3)
    for i = 1:row
        for j = 1:col
            dX = j-xC;
            dY = i-yC;
            
            r = sqrt(dX^2 + dY^2);
            if r<=rMax                
                z=sqrt(rMax^2 - r^2);

                bX = (1-1/rho)*asin(dX/(sqrt(dX^2 + z^2)));
                bY = (1-1/rho)*asin(dY/(sqrt(dY^2 + z^2)));
                
                x = round(j - z*tan(bX));
                y = round(i - z*tan(bY));
                
                intensity = 0;
                if y>=1 && y<=row && x>=1 && x<=col
                    intensity = img(y,x,ch);
%                     fprintf('%d, %d, %d, %d, %d\n',y,i,x,j,intensity);
                end

                spherical_img(i,j,ch) = intensity;
            else
                spherical_img(i,j,ch) = img(i,j,ch);
            end
        end
    end
    
end