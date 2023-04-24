function x_old = seidel(x_old,A,b)
    [~,n] = size(b);
    for i = 1:n
        sum = 0;
        for j = 1:n
            if(i==j)
                continue
            end
            sum = sum + A(i,j)*x_old(j);
        end
        x_old(i) = (b(i) - sum)/A(i,i);
    end
end