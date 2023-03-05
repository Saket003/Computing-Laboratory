%{
A polynomial has a root xo of multiplicity m - can be verified by showing that
all derivatives f1(x),f2(x),...f(m-1)(x) will have xo as a root, and
f(m)(x) will not have xo as a root.
%}
clc
format long

f = @(x) 27*x.^4 + 162*x.^3 - 180*x.^2 + 62*x - 7;
f1 = @(x) 108*x.^3 + 486*x.^2 -360*x + 62;
f2 = @(x) 324*x.^2 + 972*x - 360;
f3 = @(x) 648*x+972;
f4 = @(x) 648;


%(a) Using Plots
a = (-4:0.1:2);
plot(1/3,0,"ro")
hold("on")
title("Function and it's derivatives")
xlabel("x")
ylabel("y")
plot(a,f(a),"-")
plot(a,f1(a),"--")
plot(a,f2(a),"-.")
plot(a,f3(a),"-")
legend("(1/3,0)","f","f1","f2","f3");
figure();
hold("off")

%Using Newton's method
start = 0;
e = 10^-8;
it = 1000000000;
r = Newton_mute(f,f1,start,e,it);
r1 = Newton_mute(f1,f2,start,e,it);
r2 = Newton_mute(f2,f3,start,e,it);
disp(r);
disp(r1);
disp(r2);

%Since r3 is linear, it has only one root which is not 1/3
r3 = Newton_mute(f3,f4,start,e,it);
disp(r3);


%(b)
plot(0,0)
hold("on")
xlabel("Iteration Number")
ylabel("Ratio of new error to last error")
yline(0.665);
[r] = Newton(f,f1,start,e,it);
disp("Root: "+r);
title("Newton's method")
figure();
hold("off")
%{
As we can see, ratio of error remains approximately constant at ~0.66
Change in error is linear.
%}

%(c)
plot(0,0)
hold("on")
xlabel("Iteration Number")
ylabel("Ratio of new error to last error squared")
[r_mod] = ModNewton(f,f1,start,e,it,3);
disp("Root: "+r_mod);
title("Modified Newton's method")
hold("off")
%{
Number of iterations are too few, but since m = 3, ratio of error will be
approximately quadratic.
As we can see error decreases rapidly (excluding iteration 4, where it has reached too close to convergence)
Hence this method converges quicker.
%}

function [root] = Newton_mute(func,deriv,start,e,it)
root = 0;
last_root = start;

for c = 1:it
    root = last_root - func(last_root)/deriv(last_root);
    if abs((root-last_root)/root)<e 
        break
    end
    last_root = root;
end
end

function [root] = Newton(func,deriv,start,e,it)
root = 0;
last_root = start;
last_error = NaN;

for c = 1:it
    root = last_root - func(last_root)/deriv(last_root);
    error = abs((root-last_root)/root); %Used relative error
    plot(c,error/last_error,"ro");
    disp("Iteration "+c+" :");
    disp("Relative Error: "+abs((root-last_root)/root)+" and Root: "+root);
    disp("Ratio of new error to last error: "+(error/last_error));
    if abs(root-last_root)/root<e 
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
    error = abs((root-last_root)/root); %Used relative error
    plot(c,error/last_error^2,"bo");
    disp("Iteration "+c+" :");
    disp("Relative Error: "+abs((root-last_root)/root)+" and Root: "+root);
    disp("Ratio of new error to last error squared: "+(error/last_error^2));
    if abs(root-last_root)/root<e 
        break
    end
    last_error = error;
    last_root = root;
end
end