past_area = 10;
area = 0;

tol = 1e-6;
a = 0;
b = 1;
n = 5;
f = @(x) 1/(1+x^2);

while true
    area = Mid(f,a,b,n);
    n = n+1;
    if ((past_area-area)/area) < tol
        break;
    end
    past_area = area;
end

disp(area);