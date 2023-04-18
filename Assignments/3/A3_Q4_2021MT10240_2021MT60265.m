format long;

f = @(x)sin(x)/x;
a = 0;
b = 10;
tol = 1e-9;
area = Traps(f,a,b,1000);
disp(area);

function area = Traps(f,a,b,n)
delx = (b-a)/n;
sum = 1 + f(b); %f(a) = 1
for i = 1:n-1
    buff = f(a + i*delx);
    sum = sum + 2*buff;
end
area = sum * delx /2; 
end