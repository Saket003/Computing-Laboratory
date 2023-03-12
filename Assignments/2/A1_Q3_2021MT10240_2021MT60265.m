% Q3(a)
% ans comes out to be x1 = 1, x2 = 2, x3 = 3 %
%
A = [4,1,-1;2,7,1;1,-3,12];
b = [3,19,31];
ans1 = Jacobi(A,b,0,0,0,100);
disp('3(a)')
disp("x1 x2 x3 = ");
disp(ans1);
%end of 3(a)%

% 3(b) %
% Gauss Jacobi fails %
C = [1,2,3;2,-1,2;3,1,-2];
d = [5,1,-1];
ans2 = Jacobi(C,d,0,0,0,100);
disp('3(b)')
disp("x1 x2 x3 = ");
disp(ans2);

% helper function for Gauss Jacobi method %
function xnew = Jacobi(A,b,x1,x2,x3, iter)
    xold = [x1,x2,x3];
    xnew = [x1,x2,x3];
    count = 0;
    while count < iter
        for i = 1:3
            buff = 0;
            for j = 1:3
                if j ~= i
                    buff = buff + A(i,j)*xold(j);
                end
            end
            xnew(i) = (b(i) - buff) / A(i,i);
        end
        xold = xnew;
        count = count + 1;
    end
end