function x = Cramers_method(n,A,b)
x = ones(n,1);
D = compute_determinant(n,A);
for i = 1:n
    Ax = A;
    Ax(:,i) = b;
    Di = compute_determinant(n,Ax);
    x(i) = Di/D;
end