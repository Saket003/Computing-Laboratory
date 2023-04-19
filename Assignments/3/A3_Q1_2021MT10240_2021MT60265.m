f = @(x) 1/(1+x^2);
format long;

%(a)
area_a = Traps(f,-4,4,1);
disp(area_a);

%(b)
area_b = oneThirdSimp(f,-4,4,2);
disp(area_b);

%(c)
area_c1 = Traps(f,-4,4,10);
disp(area_c1);
area_c2 = oneThirdSimp(f,-4,4,10);
disp(area_c2);

function area = Traps(f,a,b,n)
delx = (b-a)/n;
sum = f(a) + f(b);
for i = 1:n-1
    buff = f(a + i*delx);
    sum = sum + 2*buff;
end
area = sum * delx /2; 
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