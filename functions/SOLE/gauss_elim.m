function x = gauss_elim(n,A,b)
 x = [A,b'];
 for i = 1:n-1
     for j = i+1:n
         factor = x(j,i)/x(i,i);
         x(j,:) = x(j,:) - factor*x(i,:);
     end
 end
end