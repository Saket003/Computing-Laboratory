function x = backward_subst(n,A,b)
x = zeros(n,1);
for i = n:-1:1
    sum = b(i);
    for j = i+1:n
        sum = sum - A(i,j)*x(j);
    end
    x(i) = sum/A(i,i);
end
