function root = Newton(func,deriv,start,e,it)
root = 0;
last_root = start;

for c = 1:it
    root = last_root - func(last_root)/deriv(last_root);
    if abs(root-last_root)<e 
        break
    end
    last_root = root;
end
end