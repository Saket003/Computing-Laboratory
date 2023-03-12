%{
By the given data, we have 3 equations corresponding to each of the three
time instants.
Denoting vi and ti as velocity and time at ith instant,
vi = ati^2 + bti + c for all ti in {5,8,12}
|v1|   |5^2  5  1||a|
|v2| = |8^2  8  1||b|
|v3|   |12^2 12 1||c|
V = Tx

The expected "natural" order ,i.e.,
T = [25 5 1;64 8 1;144 12 1];
V = [106.8;177.2;279.2];
Will not converge.

A sufficient critera for convergence in Gauss-Seidel is - 
|a_ii| > Sum|a_ij|
where sum is over all j = 1 to excluding i
However for n>=5,
n^2 > n+1
And thus the inequality cannot be valid for all 3 equations.

We require the system of equations to be diagonally dominant.
By the method of trial and error, the reverse order of equations is able to
converge by this method.
%}


T = [144 12 1;64 8 1;25 5 1];
V = [279.2;177.2;106.8];

xold = [1;2;5]; %Initial Guess
for it = 1:1000
    xnew = GS_iteration(xold,T,V);
    %break condition
    if(isnan(xnew(1)) && isnan(xnew(2)) && isnan(xnew(3)))
        disp("Diverging");
        break;
    end
    if (abs(xold(1) - xnew(1))/xnew(1) < 0.000001)
        if((abs(xold(2) - xnew(2))/xnew(2) < 0.001) && (abs(xold(3) - xnew(3))/xnew(3) < 0.001))
            disp("a = "+xnew(1));
            disp("b = "+xnew(2));
            disp("c = "+xnew(3));
            break;
        end
    end
    xold = xnew;
end

disp(T\V);
%Matches result from backhand op T\V

%Relevant Functions - 
function xnew = GS_iteration(xold,T,V)
    xnew = [xold(1);xold(2);xold(3)];
    xnew(1) = (V(1) - T(1,2)*xnew(2) - T(1,3)*xnew(3))/T(1,1);
    xnew(2) = (V(2) - T(2,1)*xnew(1) - T(2,3)*xnew(3))/T(2,2);
    xnew(3) = (V(3) - T(3,1)*xnew(1) - T(3,2)*xnew(2))/T(3,3);
end