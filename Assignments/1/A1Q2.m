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
e = 0.001;
it = 10000;
root = Newton(func,deriv,start,e,it);
disp(root);

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
%TODO - Add derivative function, start
e = 10^(-8);


function root = Newton(func,deriv,start,e,it)
root = 0;
last_root = start;

for c = 1:it
    root = last_root - func(last_root)/deriv(last_root);
    if abs(root-last_root)<e 
        break
    end
    last_root = root;
end
end