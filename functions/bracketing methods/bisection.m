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