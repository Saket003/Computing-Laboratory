x = [2 3 4 5 6];
y = [4 7 8 11 15];
b = [0 0 0 0];

for i = 1:4
    b(i) = div_diff(x,y,1,i+1);
    disp("b("+i+") = "+b(i))
end

g = @(z) y(1) + b(1)*(z-x(1)) + b(2)*(z-x(1))*(z-x(2)) + b(3)*(z-x(1))*(z-x(2))*(z-x(3)) + b(4)*(z-x(1))*(z-x(2))*(z-x(3))*(z-x(4));
disp("Value at (x = 4.5) = "+g(4.5))

disp("f(x_3,...x_0) = b_2 = "+b(3))
disp("f(x_2,...x_0) = b_1 = "+b(2))
disp("f(x_3,...x_1) = b_1 + b_2(x_3-x_0) = "+(b(2)+b(3)*(x(4)-x(1))))

function val = div_diff(x,y,start,last)
    if(start>=last)
        val =  y(start);
    else
        val = (div_diff(x,y,start+1,last)-div_diff(x,y,start,last-1))/(x(last)-x(start));
    end
end