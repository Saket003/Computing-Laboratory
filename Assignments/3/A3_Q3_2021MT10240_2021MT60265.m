format long;
%(a)
f = @(x)exp(x)/(1+x);
a = 0;
b = 2;
n = 4;

area = oneThirdSimp(f,a,b,n);
disp('a)');
areastring = sprintf('%0.10f',area);
disp("Definite integral using 1/3 rule = "+areastring);

%(b)
past_area = 10;
area = 0;

tol = 1e-6;
a = 0;
b = pi/2;
n = 3;
f = @(x) sin(x);
it = 0;

while true
    area = threeEighthSimp(f,a,b,n);
    it = it + 1;
    if (abs(past_area-area)/area) < tol
        break;
    end
    past_area = area;
    n = n+3;
end

areastring = sprintf('%0.10f',area);
disp('b)')
disp("Computed approximate area = "+areastring+" iterations taken = " + it);
%disp(area);
%disp(it);

function area = threeEighthSimp(f,a,b,n)
delx = (b-a)/n;
sum = f(a)+f(b);
for i = 1:n-1
    buff = f(a+i*delx);
    if mod(i, 3) == 1
        sum = sum + 3*buff;
    elseif mod(i,3) == 2 
        sum = sum + 3*buff;
    else
        sum = sum + 2*buff;
    end
area = sum * delx*3/8;
end
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