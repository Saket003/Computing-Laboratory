function A = doolittle(A)
    [n,m] = size(A);
    for i = 1:n-1
        for j = i+1:n
            f = A(j,i)/A(i,i);
            for k = i:n
                A(j, k) = A(j, k) - factor*A(i,k);
            end
            A(j,i) = f;
        end
    end
end