% The adaptive algorithm used here starts with n = 3 and increases n by 1
% until a relative difference of given tolerance is reached

past_area = 10;
area = 0;
format long;

tol = 1e-6;
a = 0;
b = 1;
n = 3;
f = @(x) 1/(1+x^2); % given function
it = 0;

while true
    it = it+1;
    area = Mid(f,a,b,n);
    if (abs(past_area-area)/area) < tol
        break;
    end
    past_area = area;
    n = n+1;
end
areastring = sprintf('%0.10f',area);
disp("Computed area = "+areastring+" iterations taken = " + it);
%disp(area);
%disp(it);

%implementation of midpoint rule%
function area = Mid(f,a,b,n)
delx = (b-a)/n;
sum = 0;
for i = 1:n
    buff = f(a + ((2*i-1)*delx)/2);
    sum = sum + buff;
end
area = sum * delx;
end