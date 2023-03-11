A = rand(10);
B = rand(10,1);

%{
Few testcases
A = [3 -0.1 -0.2; 0.1 7 -0.3; 0.3 -0.2 10];
B = [7.85;-19.3;71.4];
Slight round off error from direct operation
Ref.: Numerical Methods for Engineers

Testcase from Q1:
A = [9 3 2 0 7;7 6 9 6 4;2 7 7 8 2;0 9 7 2 2;7 3 6 4 3];
B = [35;58;53;37;39];
Lots of changes - Possibly why partial pivoting is required

Maybe issue in code - 
A = randi(100,10);
B = randi(100,10,1);
Which has only integral coefficients, however, still quite a considerable
deviation from result.

Very different in rand() case, possible since errors can scale up with
values close to 0.
%}

%(a)
A_LU = doolittle_factorization(A);
d = forward_subst(A_LU,B);      %LD = B
x = backward_subst(A_LU,d);     %UX = D
disp(x);

%(b)
x2 = A\B;
disp(x2);

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


