function val = apply_fft( fx )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n=size(fx,2);
x = 1:1:n;

if n>2
    

    x_o = 1:2:n;
    x_e = 2:2:n;

    i_e = fx(x_e);
    i_o = fx(x_o);
    i_e = apply_fft(i_e);
    i_o = apply_fft(i_o);
    factor = fac(x,n);
    
    val = [i_e + factor(1:floor(n/2)) .* i_o, i_o + factor(floor(n/2)+1:n) .* i_e];
else
    
    x_o = 2;
    x_e = 1;

    i_e = fx(x_e);
    i_o = fx(x_o);
    factor = fac(x,n);

    val = [i_e + factor(1:floor(n/2)) .* i_o, i_o + factor(floor(n/2)+1:n) .* i_e];

end

       
end

function factor = fac(x,n)
    factor = exp(-2j * pi * x / n);
end