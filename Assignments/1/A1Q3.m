%{
A polynomial has a root xo of multiplicity m - can be verified by showing that
all derivatives f1(x),f2(x),...f(m-1)(x) will have xo as a root, and
f(m)(x) will not have xo as a root.
%}
f = @(x) 27*x.^4 + 162*x.^3 - 180*x.^2 + 62*x - 7;
f1 = @(x) 108*x.^3 + 486*x.^2 -360*x + 62;
f2 = @(x) 324*x.^2 + 972*x - 360;
f3 = @(x) 648*x;
f4 = @(x) 648;

%Plots
a = (-4:0.1:2);
plot(1/3,0,"ro")
hold
plot(a,f(a),"-")
plot(a,f1(a),"--")
plot(a,f2(a),"-.")
plot(a,f3(a),"-")
hold
%This can be used, add x-axis

start = 0.5;
e = 10^-8;
it = 1000000000;

r1 = Newton(f,f1,start,e,it);
%r2 = Newton(f1,f2,start,e,it);
%r3 = Newton(f2,f3,start,e,it);
%check r3 consistently -3.33 - maybe additional step where divide by
%(x+3.33) to find that root, also to show that x-1/3 not missed for r4,
%divide by x and then get NaN by method
%r4 = Newton(f3,f4,start,e,it);
disp(r1);
%disp(r2);
%disp(r3);
%disp(r4);
%Check part (b) is a repeat? Maybe part (a) without Newton's? such as plot?

%show that quad convergence
r = ModNewton(f,f1,start,e,it,3);
%show linear
disp(r);
%Maybe return number of iterations, also ratio of errors in newton method
%block

%Optional - could create a function to compute derivative for polynomials

function root = Newton(func,deriv,start,e,it)
root = 0;
last_root = start;

for c = 1:it
    root = last_root - func(last_root)/deriv(last_root);
    disp("Iteration "+c+" error: "+abs(root-last_root));
    if abs(root-last_root)<e 
        break
    end
    last_root = root;
end
end

function root = ModNewton(func,deriv,start,e,it,m)
root = 0;
last_root = start;

for c = 1:it
    root = last_root - m*func(last_root)/deriv(last_root);
    disp("Iteration "+c+" error: "+abs(root-last_root));
    if abs(root-last_root)<e 
        break
    end
    last_root = root;
end
end