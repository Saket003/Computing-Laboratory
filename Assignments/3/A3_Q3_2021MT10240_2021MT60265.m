%(a)
f = @(x)exp(x)/(1+x);
a = 0;
b = 2;
n = 4;

area = oneThirdSimp(f,a,b,n);
disp(area);

%(b)
past_area = 10;
area = 0;

tol = 1e-6;
a = 0;
b = pi/2;
n = 1;
f = @(x) sin(x);

while true
    area = Mid(f,a,b,n);
    n = n+1;
    if ((past_area-area)/area) < tol
        break;
    end
    past_area = area;
end

disp(area);
disp(n);