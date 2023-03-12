A = rand(10);
B = rand(10,1);

%{
Note - 
Not all matrices are LU decomposible, and so solution
from dollittle factorization may not always be correct for such matrices.
If partial pivoting is implemented, solution may be found.
But even if A is invertible the algorithm may fail.

Example of a case where LU decomposition fails, but passes with pivoting is
A = [0 1;2 1];
B = [2;4];
%}

%(a)
A_LU = doolittle_factorization(A);
d = forward_subst(A_LU,B);      %LD = B
x = backward_subst(A_LU,d);     %UX = D
disp(x);

%(b)
x2 = A\B;
disp(x2);

%(a) with pivoting
[A,B] = pivot(A,B);      %Assumption made - Will atleast be pivotable
A_LU = doolittle_factorization(A);
d = forward_subst(A_LU,B);      %LD = B
x = backward_subst(A_LU,d);     %UX = D
disp(x);

%Relevant Functions - 
function A = doolittle_factorization(A)
    [n,m] = size(A);
    for i = 1:n
        for j = i+1:n
            f = A(j,i)/A(i,i);
            A(j,:) = A(j,:) - f*A(i,:);
            A(j,i) = f;
        end
    end
end

function [A_new,B_new] = pivot(A,B)
    [n,m] = size(A);
    for i = 1:n
        max_row = i;
        max = A(i,i);
        for j = i+1:n
            if(A(j,i)>max)
                max = A(j,i);
                max_row = j;
            end
        end
        row1 = A(i,:);
        row2 = A(max_row,:);

        temp = B(max_row);
        B(max_row) = B(i);
        B(i) = temp;
        for k = 1:m
            A(i,k) = row2(1,k);
            A(max_row,k) = row1(1,k);
        end
    end
    A_new = A;
    B_new = B;
end

function D = forward_subst(A_LU,B)
    [n,m] = size(A_LU);
    D = zeros(n,1);
    for i = 1:n
        b = B(i);
        for j = 1:i-1
            b = b - A_LU(i,j)*D(j);
        end
        D(i) = b;
    end
end

function x = backward_subst(A_LU,d)
    [n,m] = size(A_LU);
    x = zeros(n,1);
    for i = n:-1:1
        b = d(i);
        for j = i+1:n
            b = b - A_LU(i,j)*x(j);
        end
        x(i) = b/A_LU(i,i);
    end
end


