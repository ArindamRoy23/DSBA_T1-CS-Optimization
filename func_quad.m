function [F] = func_quad(x)
x1 = x(1);
x2 = x(2);
F = x1^2 + x2^2 - x1*x2 - 3*x1 + 2;
