f = [4;1];
A = [-20,-3;-1,-13;4,.2];
b = [-42; -40; 12];
lb = [0,0];
ub = [inf, inf];
[x,fval,exitflag,output] = intlinprog(f,[1,2],A,b,[],[],lb,[]);

disp(x);
disp(fval);