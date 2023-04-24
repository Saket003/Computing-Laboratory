function [root,iter] = ModNewton(func,deriv,start,e,m)
format long
root = 0;
last_root = start;
last_error = NaN;
iter = 0;

while true
    root = last_root - m*func(last_root)/deriv(last_root)
    iter = iter+1;
    error = abs(root-last_root);
    disp("Ratio of new error to last error: "+(error/last_error));
    last_error = error;
    if abs(root-last_root)<e 
        break
    end
    last_root = root;
end
end