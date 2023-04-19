x = [1 1.3 1.6 1.9 2.2];
y = [0.1411 -0.6878 -0.9962 -0.5507 0.3115];
b = [0 0 0 0];

for i = 1:4
    b(i) = div_diff(x,y,1,i+1);
    disp("b("+i+") = "+b(i))
end

g = @(z) y(1) + b(1).*(z-x(1)) + b(2).*(z-x(1)).*(z-x(2)) + b(3).*(z-x(1)).*(z-x(2)).*(z-x(3)) + b(4).*(z-x(1)).*(z-x(2)).*(z-x(3)).*(z-x(4));
disp("Value at (x = 1.5) = "+g(1.5))
plot(x,g(x),"ro");
disp("Similar to sine")

function val = div_diff(x,y,start,last)
    if(start>=last)
        val =  y(start);
    else
        val = (div_diff(x,y,start+1,last)-div_diff(x,y,start,last-1))/(x(last)-x(start));
    end
end