%{
(a)
x = 1/a is equivalent to
=> a - 1/x = 0
Let f(x) be a - 1/x, then f'(x) = 1/x^2 and f(x) / f'(x) = ax^2 - x
%}
%{
Reciprocal function works for both positive and negative 'a' with magnitude
between 1e-154 to 1e100. The upper limit around 1e100 is due to the start
point being 1e-100. The error tolelarnce is 1e-8 (relative error).
%}
clc;
format long;
a = input("Enter 'a' : ");
signVar = 1;
if(a < 0)
    signVar = 0;
end
func = @(x) a - (1/x);
deriv = @(x) 1/(x^2);
divisionFunc = @(x) abs(a)*(x^2) - x;
start = 10^-100;
e = 1e-8;
if a == 0
    disp("Can't divide by 0")
else
root = reciprocalNewton(divisionFunc,start,e);
if signVar == 0
    root = root * -1;
end
rootstring = sprintf('%0.100f',root);
disp("a) x = 1/a = ");
disp(root);
end

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
root1 = root;
root2 = 20 - root;

rootstring1 = sprintf('%0.15f',root1);
rootstring2 = sprintf('%0.15f',root2);

disp("b) Numbers are: "+rootstring1+" and "+ rootstring2);
%disp(root);
%disp(20 - root);

function root = reciprocalNewton(divisionFunc,start,e)
root = 0;
last_root = start;

while true
    root = last_root - divisionFunc(last_root);
    if abs(root-last_root)/root<e %relative error for termination%
        break
    end
    last_root = root;
end
end
function root = Newton(func,deriv,start,e)
root = 0;
last_root = start;

while true
    root = last_root - func(last_root)/deriv(last_root);
    if abs(root-last_root)/root<e 
        break
    end
    last_root = root;
end
end