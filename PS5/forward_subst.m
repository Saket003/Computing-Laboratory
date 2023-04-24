function x = forward_subst(n,A,b)
x = zeros(n,1);
for i = 1:n
    sum = b(i);
    for j = 1:i-1
        sum = sum - A(i,j)*x(j);
    end
    x(i) = sum/A(i,i);
end
