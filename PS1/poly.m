function p = poly(x,num)
    if num == 1
    p = power(x,3) - 30*power(x,2) + 2552;
    end
    if num == 2
    p = power(x,3) - 7*power(x,2) + 14*x - 6;
    end
    if num == 3
    p = exp(-x) - x;
    end
end