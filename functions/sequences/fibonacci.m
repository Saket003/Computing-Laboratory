a = 0
b = 1
disp(a)
disp(b)
for i = 1:20
    c = a+b
    disp(c)
    a = b
    b = c
end
