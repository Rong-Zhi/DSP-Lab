function  x_head = moving_average( n, m )
%MOVING_AVERAGE Summary of this function goes here
%   Detailed explanation goes here
load glob_warm.mat;

x_head = zeros(158,1);

for l =1:n
    if l < (m+1);
        x_head(l) = Ta(l);
    elseif l > (n-m);
        x_head(l) = Ta(l);
    elseif l>=(m+1) && l <=(n-m)
        for k = -m:m
            x_head(l) = x_head(l) + Ta(l+k);
        end
            x_head(l) = x_head(l)/(2*m+1);
    end
end
end