function [root,iter] = Newton(func,deriv,start,e,i)
format long
root = 0;
last_root = start;
last_error = NaN;
iter = 0;

while true
    root = last_root - func(last_root)/deriv(last_root);
    i = i-1;
    iter = iter+1;
    error = abs(root-last_root);
    if i<0
        break
    end
    %disp("Ratio of new error to last error: "+(error/last_error));
    %disp("Ratio of new error to last error squared: "+(error/(last_error^2)));
    last_error = error;
    if abs(root-last_root)<e 
        break
    end
    last_root = root;
end
end