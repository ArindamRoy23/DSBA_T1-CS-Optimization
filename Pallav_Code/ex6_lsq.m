function obj = ex6_lsq(x) %%We take two variables(which are actually the different element sin the vector x) 
    k=size(x);
    n=k(2);
    j=k(2);
    obj =zeros(1,2*(n-1));

    for i=2:n
    obj(i)= 10*(x(i)-(x(i-1))^2); %I compute the square root of the the F1s first
    end
    for i=2:n
    obj(i+j)= 1-x(i-1); %I compute the square root of the the F1s first
    end
end