
function x = gauss_jordan(n,A,b)
 x = [A,b'];
 for i = 1:n
     x(i,:) = x(i,:)/x(i,i);
     for j = 1:n
         if i ~= j
         factor = x(j,i)/x(i,i);
         x(j,:) = x(j,:) - factor*x(i,:);
         end
     end
 end
end