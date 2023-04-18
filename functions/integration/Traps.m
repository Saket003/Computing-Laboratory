function area = Traps(f,a,b,n)
delx = (b-a)/n;
sum = f(a) + f(b);
for i = 1:n-1
    buff = f(a + i*delx);
    sum = sum + 2*buff;
end
area = sum * delx /2; 
end