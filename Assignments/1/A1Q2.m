%{
(a)
x = 1/a is equivalent to
=> ax = 1
=> ax-1 = 0
%}

a = input("");
func = @(x) a*x - 1;
deriv = @(x) a;
start = 0;
e = 0.0001;

root = Newton(func,deriv,start,e);
disp("a) x = 1/a = "+root);


%{
(b)
Let the real numbers be x and y,
x + y = 20
=> y = 20 - x

(x+x^0.5)(y+y^0.5) = 155.55
(x+x^0.5)(y+y^0.5) - 155.55 = 0
Substitute y as f(x)

%}

y = @(x) 20-x;
func = @(x) (x+x^0.5)*(y(x)+y(x)^0.5)-155.55;
deriv = @(x)(1 + 1/(2*sqrt(x)))*(20-x + sqrt(20-x)) - (x + sqrt(x))*(1 + 1/(2*sqrt(20-x)));
start = 5; %derivative DNE at 0 and 20, and is 0 at 10%
e = 10^(-8);
root = Newton(func,deriv,5,e);
format long;
disp("b) numbers are: ");
disp(root);
disp(20 - root);


function root = Newton(func,deriv,start,e)
root = 0;
last_root = start;

while true
    root = last_root - func(last_root)/deriv(last_root);
    if abs(root-last_root)<e 
        break
    end
    last_root = root;
end
end