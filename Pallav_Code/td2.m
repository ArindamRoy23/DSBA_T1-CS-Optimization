
x = intlinprog(f,intcon,A,b) solves 
min f'*x such 
that the components of x in intcon are integers, and A*x ≤ b.



f = -[40 35 18 4 10 2];
intcon = 1:6;
A = [25 12.5 11.25 5 2.5 1.25];
b = 26;
% gives num_cols of A 
n = size(A,2);
lb = zeros(n,1);
ub1 = ones(n,1);
ub2 = inf+lb;

x1 = intlinprog(f,intcon,A,b,[],[],lb,ub1) ;
value = -f*x1;
weight = A*x1;


% sol2a
x2a = intlinprog(f,intcon,A,b,[],[],lb,ub2) ;
value2a = -f*x2a;
weight2a = A*x2a;

% sol2b
x2b = intlinprog(f,intcon,A,b,[],[],lb,[]) ;
value2b = -f*x2b;
weight2b = A*x2b;


% question 2


fun = @obj
x0 = [0,0];
[q2,fval] = fminsearch(fun,x0)

