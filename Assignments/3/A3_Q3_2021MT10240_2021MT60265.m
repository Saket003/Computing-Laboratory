format long;
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

function area = oneThirdSimp(f,a,b,n)
delx = (b-a)/n;
sum = f(a)+f(b);
for i = 1:n-1
    buff = f(a+i*delx);
    if mod(i, 2) == 1
        sum = sum + 4*buff;
    else
        sum = sum + 2*buff;
    end
end
area = sum * delx/3;
end