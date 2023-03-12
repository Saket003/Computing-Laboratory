% ans comes out to be x = [0, 1, 2, 3, 4] %

A = [9,3,2,0,7;7,6,9,6,4;2,7,7,8,2;0,9,7,2,2;7,3,6,4,3];
b = [35,58,53,37,39];
x = Gauss(A,b);
disp('x = ');
disp(x);

%Functions for Gauss elimination with Partial pivoting%
function xans = Gauss(A,b)
xans = [0,0,0,0,0];
[m,n] = size(A);
s = [0,0,0,0,0];
for i = 1:5
    s(i) = abs(A(i,1));
    for j = 2:5
        if abs(A(i,j))>s(i)
            s(i) = abs(A(i,j));
        end
    end
end
[A,b,er] = Eliminate(A,b,s,n,0.00001,0.0001);
if er~=-1
    xans = Substitute(A,b,n);
end
end

function [A,b,er] = Eliminate(A, b, s,n, tol, er)
for k = 1:n-1
    [A,b,s] = Pivot(A,b,s,n,k);
    if abs(A(k,k)/s(k)) < tol
        er = -1;
    break
    end
    for i = k+1:n
        factor = A(i,k)/A(k,k);
        for j = k+1:n
            A(i,j) = A(i,j) - factor*A(k,j);
        end
        b(i) = b(i) - factor*b(k);
    end
end
if abs(A(n,n)/s(n)) < tol
    er = -1;
end
end

function [A, b, s] = Pivot(A, b, s,n, k)
p = k;
big = abs(A(k,k)/s(k));
for count = k+1:n
    buffer = abs(A(count, k)/s(count));
    if buffer > big
        big = buffer;
        p = count;
    end
end
if p ~= k
    for count = k:n
        buffer = A(p, count);
        A(p, count) = A(k, count);
        A(k, count) = buffer;
    end
    buffer = b(p);
    b(p) = b(k);
    b(k) = buffer;
    buffer = s(p);
    s(p) = s(k);
    s(k) = buffer;
end
end

function x = Substitute(A, b,n)
x = [0,0,0,0,0];
x(n) = b(n)/A(n,n);
for i = n-1:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum + A(i,j)*x(j);
    end
    x(i) = (b(i) - sum) / A(i,i);
end
end