function [f,g] = myobj1(z)
x=z(1);
y=z(2);
f = power((y-sin(2*x)-0.1*x*x),2);
g(1) = -2*(2*cos(2*x)+0.2*x)*(y-sin(2*x)-0.1*x*x);
g(2) = 2*(y-sin(2*x) -0.1*x*x);
