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
area = sum * delx/3;
end
end