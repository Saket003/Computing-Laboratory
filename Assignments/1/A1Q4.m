a = -10;
b = 15;
s = 0.1;
func = @(x) tanh(x);
deriv = @(x) sech(x)*sech(x);

[r2,i3] = hybrid(func,deriv,a,b,s,0.001) %precise 0 and lesser iterations unless we have good estimate of root

[r1,i1] = bisection(func,a,b,0.001)
[r2,i2] = Newton(func,deriv,(a+b)/2,0.001)
[r3,i3] = Newton(func,deriv,0.25,0.001) %need to fix start so converges - then may be quicker?

function [root,it] = hybrid(func,deriv,xl,xu,s,e)
    a = xl;
    b = xu;
    it = 0;
    while (func(xl)*func(xu))<0
    it = it+1;
    xrnew = (xl+xu)/2;
    if abs(xl-xu)<s*abs(a-b)
        break
    end
    if (func(xrnew)*func(xu))<0
        xl = xrnew;
        continue
    end
    if (func(xrnew)*func(xl))<0
        xu = xrnew;
        continue
    end
    end

    mid = (xu+xl)/2;
    [root,i] = Newton(func,deriv,mid,e);
    it = it + i;
end

function [root,it] = bisection(poly,xl,xu,tolerance)
it = 0;
while (poly(xl)*poly(xu))<0
    it = it+1;
    xrnew = (xl+xu)/2;
    if poly(xrnew)<tolerance && poly(xrnew)>-1*tolerance
        root = xrnew;
        break
    end
    if (poly(xrnew)*poly(xu))<0
        xl = xrnew;
        continue
    end
    if (poly(xrnew)*poly(xl))<0
        xu = xrnew;
        continue
    end
end
end

function [root,iter] = Newton(func,deriv,start,e)
root = 0;
last_root = start;
iter = 0;

while true
    root = last_root - func(last_root)/deriv(last_root);
    if(isnan(root))
        break
    end
    iter = iter+1;
    if abs(root-last_root)<e 
        break
    end
    last_root = root;
end
end