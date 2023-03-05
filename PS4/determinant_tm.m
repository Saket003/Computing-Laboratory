function x = determinant_tm(B)
    x = 1;
    [n,m] = size(B);
    for i = 1:n
        x = x*B(i,i);
    end