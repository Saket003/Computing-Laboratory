function x = compute_determinant(n,A)
    top = A(1,:);
    x = 0;
    if(n==2)
        x = (A(1,1)*A(2,2)-A(1,2)*A(2,1));
        return 
    end
    for i = 1:n
        factor = top(i)*(power(-1,(i+1)));
        if(factor == 0)
            continue
        end
        B1 = A(2:n,1:i-1);
        B2 = A(2:n,i+1:n);
        B = horzcat(B1,B2);
        x = x + factor*compute_determinant(n-1,B);
    end