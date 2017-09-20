function val = apply_fft( fx )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n=size(fx,2);


if n>1
    
    x = 1:1:n;
    x_o = 1:2:n;
    x_e = 2:2:n;

    i_e = fx(x_e);
    i_o = fx(x_o);
    i_e = apply_fft(i_e);
    i_o = apply_fft(i_o);
    factor = exp(-2j * pi * x / n);
    
    val = [i_e + factor(1:floor(n/2)) .* i_o, i_o + factor(floor(n/2)+1:n) .* i_e];
else
    val=0;
end

       
end

