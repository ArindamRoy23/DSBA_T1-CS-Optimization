
f = -[40; 35; 18; 4; 10; 2];
intcon = 1:6;
A = [25 12.5 11.25 5 2.5 1.25];
b = 25;
% gives num_cols of A 
n = size(A,2);
lb = zeros(n,1);
ub1 = ones(n,1);
ub2 = inf+lb;

[x,fval,exitflag,output] = intlinprog(f,intcon,A,b,[],[],lb,ub1) ;

disp(fval);
disp(x);
disp(output);

% value = -f*x1;
% weight = A*x1;
