function A = cholesky(A)
    if(~issymmetric(A))
        disp("Not Symmetric")
    else
        [n,~] = size(A);
        for k = 1:n %Rows first?
            for i = 1:k-1
                sum = 0;
                for j = 1:i-1
                    sum = sum + A(i,j)*A(k,j);
                end
                A(k,i) = (A(k,i) - sum)/A(i,i);
            end

            sum = 0;
            % i = k case
            for j = 1:k-1
                sum = sum + A(k,j)*A(k,j);
            end
            A(k,k) = sqrt(A(k,k)-sum);
        end
        %Setting upper as L too
        for k = 1:n
            for i = k+1:n
                A(k,i) = A(i,k);
            end
        end
    end
end