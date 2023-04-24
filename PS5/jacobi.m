function x_new = jacobi(x_old,A,b)
    [~,n] = size(b);
    x_new = zeros(1,n);
    for i = 1:n
        sum = 0;
        for j = 1:n
            if(i==j)
                continue
            end
            sum = sum + A(i,j)*x_old(j);
        end
        x_new(i) = (b(i) - sum)/A(i,i);
    end
end