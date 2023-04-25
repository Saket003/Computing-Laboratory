%(a)
f = @(x) sin(pi*x);
f_d = @(x) pi*cos(pi*x);
a = 0;
b = 1;
g = @(x) sqrt(1+(f_d(x))^2);

disp("Length for n=16,32,64 by Trapezoidal is")
n = 16;
length = Trapz(g,a,b,n);
disp(length)
n = 32;
length = Trapz(g,a,b,n);
disp(length)
n = 64;
length = Trapz(g,a,b,n);
disp(length)

disp("Length for n=16,32,64 by Simpsons is")
n = 16;
length = Simps(g,a,b,n);
disp(length)
n = 32;
length = Simps(g,a,b,n);
disp(length)
n = 64;
length = Simps(g,a,b,n);
disp(length)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(b)

f = @(x) exp(x^2);
f_d = @(x) 2*x*exp(x^2);
a = 0;
b = 2;
g = @(x) sqrt(1+(f_d(x))^2);

disp("Length for n=16,32,64 by Trapezoidal is")
n = 16;
length = Trapz(g,a,b,n);
disp(length)
n = 32;
length = Trapz(g,a,b,n);
disp(length)
n = 64;
length = Trapz(g,a,b,n);
disp(length)

disp("Length for n=16,32,64 by Simpsons is")
n = 16;
length = Simps(g,a,b,n);
disp(length)
n = 32;
length = Simps(g,a,b,n);
disp(length)
n = 64;
length = Simps(g,a,b,n);
disp(length)

function area = Trapz(g,a,b,n)
    sum = g(a);
    for i = 1:n-1
        x = a + i*(b-a)/n;
        sum = sum + 2*g(x);
    end
    sum = sum + g(b);
    area = (b-a)*sum/(2*n);
end

function area = Simps(g,a,b,n)
    sum = g(a);
    for i = 1:2:n-1
        x = a + i*(b-a)/n;
        sum = sum + 4*g(x);
    end
    for i = 2:2:n-2
        x = a + i*(b-a)/n;
        sum = sum + 2*g(x);
    end
    sum = sum + g(b);
    area = (b-a)*sum/(3*n);
end