function [root,iter] = Secant(func,first,second,e,i)
root = 0;
last_root = second;
second_last = first;
last_error = NaN;
iter = 0;

while true
    root = last_root - func(last_root)*(second_last-last_root)/(func(second_last)-func(last_root));
    i = i-1;
    iter = iter+1;
    error = abs(root-last_root);
    %disp("Ratio of new error to last error: "+(error/last_error));
    if i<0
        break
    end
    last_error = error;
    if abs(root-last_root)<e 
        break
    end
    last_root = root;
end
end