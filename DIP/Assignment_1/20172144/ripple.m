function ripple_img = ripple(img,aX,aY,tX,tY)
r = size(img,1);
c = size(img,2);

ripple_img = zeros(size(img),'uint8');

for ch = 1:size(img,3)
    for i = 1:r
        for j = 1:c
            
            y = round(i + (aY)*(sin((2*pi*j)/(tY))));
            x = round(j + (aX)*(sin((2*pi*i)/(tX))));
            intensity = 0;
            
            if y>=1 && y<=r && x>=1 && x<=c
                intensity = img(y,x,ch);
            end
            
            
            ripple_img(i,j,ch) = intensity;
        end
    end
end