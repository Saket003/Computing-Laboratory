a = -10;
b = 15;
s = 0.1;
func = @(x) tanh(x);
deriv = @(x) sech(x)*sech(x);

%Hybrid Method
[r3,i3] = hybrid(func,deriv,a,b,s,0.001); %precise 0 and lesser iterations unless we have good estimate of root
disp("Root: "+r3+", Iterations: "+i3);

%(a)
[r2,i2] = Newton(func,deriv,(a+b)/2,0.001);
disp("Root: "+r2+", Iterations: "+i2); %missing due to NaN
[r2,i2] = Newton(func,deriv,0.25,0.001);
disp("Root: "+r2+", Iterations: "+i2);
%Here, it may take lesser iterations but may also diverge - less safe and
%the number of iterations is dependent upon initial point.

%(b)
[r1,i1] = bisection(func,a,b,0.001);
disp("Root: "+r1+", Iterations: "+i1);
%Hybrid method takes considerably lesser iterations

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

function [root,it] = bisection(poly,xl,xu,e)
it = 0;
xrold = NaN;

while (poly(xl)*poly(xu))<0
    it = it+1;
    xrnew = (xl+xu)/2;
    if abs(xrnew-xrold)<e
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
    xrold = xrnew;
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