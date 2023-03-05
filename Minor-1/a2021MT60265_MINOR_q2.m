	function C = gauss_elimination(A,B)
    i = 1; % loop variable
    X = [ A B ]; % Augumented matrix
    [ n, m ] = size(X); % size of matrix   
    while i <= n
        if X(i,i) == 0 % checking if the diagonal elements are zero or not
            X = pivot(X, i); % code your own
        end
        X = gauss_jordan(X,i,i); % code your own
        i = i +1;
    end    
    C = X(:,m);
end

 function X = pivot(X, i)
    row1 = X(i,:);
    k = i+1;
    [n,m] = size(X);
    while k<=n
        if X(k,i) ~= 0
            break;
        end
        k = k+1;
    end
    if(k==n+1)
        disp("Pivot can not find non-zero entry")
        return;
    end
    row2 = X(k,:);
    for j=1:m
        X(i,j) = row2(1,j);
        X(k,j) = row1(1,j);
    end
    
    return;
end

function X = gauss_jordan(X,i,j)
    [n,m] = size(X);
    row_global = X(i,:)/X(i,i);
    X(i,:) = row_global;
    for k = 1:n
        if(k==i)
            continue;
        end
        X(k,:) = X(k,:) - (X(k,i))*row_global;
    end
    return;
end

