function [root,it] = bisection(xl,xu,tolerance,num)
it = 0;
while (poly(xl,num)*poly(xu,num))<0
    it = it+1;
    xrnew = (xl+xu)/2;
    if poly(xrnew,num)<tolerance && poly(xrnew,num)>-1*tolerance
        root = xrnew;
        break
    end
    if (poly(xrnew,num)*poly(xu,num))<0
        xl = xrnew;
        continue
    end
    if (poly(xrnew,num)*poly(xl,num))<0
        xu = xrnew;
        continue
    end
end
end