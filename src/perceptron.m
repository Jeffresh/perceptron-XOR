function [so,w] = perceptron(x, w, logical_function, activation_function)
%PERCEPTRON Summary of this function goes here
%   Detailed explanation goes here

sd = desired_output(x,logical_function);
so = compute_perceptron(w,x,activation_function);

if sd ~= so
    if sd <0
        sd = -1;
    end
    if so < 0
        so=-1;
    end
    error = sd - so;
    w = w+error*x;
end

if so < 0
    so =0;
end

end

