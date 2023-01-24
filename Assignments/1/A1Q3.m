%{
A polynomial has a root xo of multiplicity m - can be verified by showing that
all derivatives f1(x),f2(x),...f(m-1)(x) will have xo as a root, and
f(m)(x) will not have xo as a root.
%}
clc
f = @(x) 27*x.^4 + 162*x.^3 - 180*x.^2 + 62*x - 7;
f1 = @(x) 108*x.^3 + 486*x.^2 -360*x + 62;
f2 = @(x) 324*x.^2 + 972*x - 360;
f3 = @(x) 648*x;
f4 = @(x) 648;


%(a) Using Plots
a = (-4:0.1:2);
plot(1/3,0,"ro")
hold("on")
plot(a,f(a),"-")
plot(a,f1(a),"--")
plot(a,f2(a),"-.")
plot(a,f3(a),"-")
legend("(1/3,0)","f","f1","f2","f3");
pause(10)
hold("off")

start = 0;
e = 10^-8;
it = 1000000000;
plot(0,0)
hold("on")
%(b)
[r] = Newton(f,f1,start,e,it);
disp("Root: "+r);
disp("");
%{
As we can see, ratio of error remains approximately constant at ~0.66
Change in error is linear.
%}

%(c)
[r_mod] = ModNewton(f,f1,start,e,it,3);
disp("Root: "+r_mod);
title("Ratio of current error by previous error")
legend("Modified Newton's","Newton's")
hold("off")
%{
Number of iterations are too few, but since m = 3, ratio of error will be
approximately quadratic.
As we can see error decreases rapidly (excluding iteration 4, where it has reached too close to convergence)
Hence this method converges quicker.
%}

function [root] = Newton(func,deriv,start,e,it)
root = 0;
last_root = start;
last_error = NaN;

for c = 1:it
    root = last_root - func(last_root)/deriv(last_root);
    error = abs(root-last_root);
    plot(error,last_error,"ro");
    disp("Iteration "+c+" :");
    disp("Error: "+abs(root-last_root)+" and Root: "+root);
    disp("Ratio of new error to last error: "+(error/last_error));
    if abs(root-last_root)<e 
        break
    end
    last_error = error;
    last_root = root;
end
end


function [root] = ModNewton(func,deriv,start,e,it,m)
root = 0;
last_root = start;
last_error = NaN;
for c = 1:it
    root = last_root - m*func(last_root)/deriv(last_root);
    error = abs(root-last_root);
    plot(error,last_error,"bo");
    disp("Iteration "+c+" :");
    disp("Error: "+abs(root-last_root)+" and Root: "+root);
    disp("Ratio of new error to last error: "+(error/last_error));
    if abs(root-last_root)<e 
        break
    end
    last_error = error;
    last_root = root;
end
end