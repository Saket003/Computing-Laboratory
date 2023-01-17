function root = Secant(func,first,second,e,it)
root = 0;
last_root = second;
second_last = first;

for c = 1:it
    root = last_root - func(last_root)*(second_last-last_root)/(func(second_last)-func(last_root));
    if abs(root-last_root)<e 
        break
    end
    last_root = root;
end
end