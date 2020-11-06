function output = hardlims(w,x)
%HARDLIMS Summary of this function goes here
%   Detailed explanation goes here
output = x*w';

if output >=0
    
    output = 1;
else
    output = -1;
end

