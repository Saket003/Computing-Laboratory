func = @(x) (x-4)^2 *(x+2); %given function%

[r1,i1] = falsePosition(func,-2.5,-1,0.001);
root = r1;
disp(root);


%False Position Method%
function [root,it] = falsePosition(poly,xl,xu,tolerance)
it = 0;
xrnew = xl;
xrold = xu;
while (poly(xl)*poly(xu))<0
    it = it+1;
    xrold = xrnew;

    xrnew = xu - ((poly(xu)*(xu - xl))/(poly(xu) - poly(xl)));

    if abs(xrold - xrnew)<tolerance  %absolute error in terminating condition%
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