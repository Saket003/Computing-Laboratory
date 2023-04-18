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