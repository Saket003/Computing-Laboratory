A = [3 -0.1 -0.2;0.1 7 -0.3;0.3 -0.2 10];
b = [7.85 -19.3 71.4];
x = [0 0 0];

for  i = 1:3
    x_new = GS(x,A,b);
    %Computing relative error by L2 Norm
    disp("Relative Error : " + abs(norm((x_new-x),2)/norm(x_new,2)));
    x = x_new;
end
disp(x);


function x_new = GS(x,A,b)
    [~,d] = size(x);
    x_new = zeros(1,d);
    for i = 1:d
        x_new(i) = x(i);
    end

    [~,n] = size(b);
    for i = 1:n
        sum = 0;
        for j = 1:n
            if(i==j)
                continue
            end
            sum = sum + A(i,j)*x_new(j);
        end
        x_new(i) = (b(i)-sum)/A(i,i);
    end
end