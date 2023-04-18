f = @(x) 1/(1+x^2);

%(a)
area_a = Traps(f,-4,4,1);
disp(area_a);

%(b)
area_b = oneThirdSimp(f,-4,4,1);
disp(area_b);

%(c)
area_c1 = Traps(f,-4,4,10);
disp(area_c1);
area_c2 = oneThirdSimp(f,-4,4,10);
disp(area_c2);

