past_area = 10;
area = 0;
format long;

tol = 1e-6;
a = 0;
b = 1;
n = 5;
f = @(x) 1/(1+x^2);

while true
    area = Mid(f,a,b,n);
    if ((past_area-area)/area) < tol
        break;
    end
    past_area = area;
    n = n+1;
end
disp(area);
disp(n);

function area = Mid(f,a,b,n)
delx = (b-a)/n;
sum = 0;
for i = 1:n
    buff = f(a + ((2*i-1)*delx)/2);
    sum = sum + buff;
end
area = sum * delx;
end