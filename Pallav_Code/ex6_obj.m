function obj = ex6_obj(x) %%We take two variables(which are actually the different elements in the vector x) 
    n=10;
    obj=0;
    for i=2:n
    obj= obj + 100*(x(i)-(x(i-1))^2)^2 + (1-x(i-1))^2;
    end
end