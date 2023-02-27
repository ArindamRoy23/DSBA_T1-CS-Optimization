function obj = fun_obj(x) %%We take two variables(which are actually the different element sin the vector x) 
    obj=(x(2)-cos(2*x(1))-((x(1)^2)/10))^2 + exp((x(1)^2+x(2)^2)/100);
end