r = input("Enter radius:");
%x + y = 2*pi;
%y = 2*x;
x = 2*pi/3;
f = @(t) t - 2*r*sin(x/2);

d = @(t) 1;

x0 = 2*r;
while(true)
    xnew = x0 - f(x0)/d(x0);
    if(abs(x0-xnew)<0.0001)
        disp(xnew) %Added
        break;
    end
    x0 = xnew;
end
