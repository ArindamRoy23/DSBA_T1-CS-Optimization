function [F,G] = q4(X)
x = X(1);
y = X(2);
F = y - cos(2*x);
G = exp((x.^2 + y.^2)/50)