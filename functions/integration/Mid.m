function area = Mid(f,a,b,n)
delx = (b-a)/n;
sum = 0;
for i = 1:n
    buff = f(a + ((2*i-1)*delx)/2);
    sum = sum + buff;
end
area = sum * delx;
end