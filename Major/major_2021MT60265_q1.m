x1 = [0 0.2 0.4]; %2 Equal Intervals
x2 = [0.4 0.5 0.6 0.7]; %3 Equal Intervals
f = @(x) 0.2 + 2.5*x - 200*x^2 + 675*x^3 -900*x^4+400*x^5;

a1 = Simp13(x1,f);
a2 = Simp38(x2,f);
area = a1+a2;
disp("Area : " + area);

function a = Simp13(x,f)
    width = x(3) - x(1);
    height = f(x(1)) + 4*(f(x(2))) + f(x(3));
    a = (width*height)/6;
end

function a = Simp38(x,f)
    width = x(4) - x(1);
    height = f(x(1)) + 3*(f(x(2))) + 3*f(x(3)) + f(x(4));
    a = (width*height)/8;
end