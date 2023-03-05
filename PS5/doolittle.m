function A = doolittle(A)
    [n,m] = size(A);
    for i = 1:n
        for j = i+1:n
            f = A(j,i)/A(i,i);
            A(j,:) = A(j,:) - f*A(i,:);
            A(j,i) = f;
        end
    end
end