f = @(x)sin(x)/x;
a = 0;
b = 10;
tol = 1e-6;
area = Traps(f,a,b,n);
disp(area);