%%%%%%%%%Should be something close to this, don't think this is 100%
%%%%%%%%%right%%%%
%%% Exercise 3:
x = -10:0.1:10;
y = -0.4:0.1:10;
x;

%%%We take a funciton f:
fstyb=@Steve
for j=1: length(x),
    for i=1 : length(y),
        %where i is row index(y) and j is column index(x)
        val_x = x(j);
        val_y = y(i);
        z(i,j) = fstyb([val_x,val_y]); 
    end;
end;


figure(1),surf(x,y,z), colormap hsv
xlabel('x'); ylabel('y');
camlight;
shading interp
lighting gouraud
view(3)

%%To visualize the level sets:
figure(2),
contour3(x,y,z,[0:1:10]); 
%contour(x,y,z,[0:1:10]); 
xlabel('x');ylabel('y');

%% 

%%%%%%%%Exercise 4:%%%%

f7 = @fun_obj;

for j=1: length(x)
    for i=1 : length(y)
        %where i is row index(y) and j is column index(x)
        val_x = x(j);
        val_y = y(i);
        z(i,j) = f7([val_x,val_y]);
    end
end

figure(1),surf(x,y,z), colormap hsv
xlabel('x'); ylabel('y');
camlight;
shading interp
lighting gouraud
view(3)

%%To visualize the level sets:
figure(2),
contour3(x,y,z,[0:1:10]); 
xlabel('x');ylabel('y');
%% 

%%%%Now I need to minimize the objective funtion by musigng fminunc since
%%%%this is an unconstrained minimzation problem:
%%%%IMPORTANT NOTE : FMINUNC ONLY TAKES FUNCTIONS WITH ONE VARIALBES which
%%%%is why I defined the variables as f(x) where x(1)=x & x(2)=y
%%%%%%%%%%%%%%%%%%UNCONSTRAINED MINIMIZATION:%%%%%%%%%%5
%our f is f7

f7 = @fun_obj;

iter_num=10; % change as per your requirement

x0=[];

for i=1:2
    x0(i)=randi([0 100]);
end

options = optimoptions(@fminunc,'Display','iter','CheckGradients',true);
% [x,fval,exitflag,output,lambda] = fminunc(f7,x0,options);

% options = optimoptions('fminunc');
% options = optimoptions(options, 'Display','iter','CheckGradients',true,'MaxFunctionEvaluations',1000,'StepTolerance',exp(-10) ...
%      ,'SpecifyObjectiveGradient',true);
 

fprintf('x0 = (%.2f, %.2f), f = %f\n', x0(1), x0(2), fun_obj(x0));

[xsol,fval,exitflag,output,lambda] = fminunc(f7, x0, options);

% [xsol,fval] = fminunc(f7, x0, options);

fprintf('final solution = (%.2f, %.2f), f = %f\n', xsol(1), xsol(2), fval);
fprintf('exit flag = (%2f)', exitflag);
output
lambda


%% 

%We may get stuck in local minimum,
x0 = [0,0];

[xsol,fval,exitflag,output,grad,hessian] = fminunc(f7, x0, options);
fprintf('final solution = (%.2f, %.2f), f = %f\n', xsol(1), xsol(2), fval);
fprintf('exit flag = (%2f)', exitflag);
output
grad
hessian

%% 


%%%EX5%%%
%%Constrained minimization:
%%We add the constraint 4-x <= y

options = optimoptions('fmincon','Display','iter','CheckGradients',true);
A= [-1 ,-1];
b= -4;
x0=[0,0];

[x,fval,exitflag,output,lambda] = fmincon(f7,x0,A,b,[],[],[],[],[],options)
Lag=lambda
Lag %%The lagrange multiplier tells me how sensitive my function is to the constraint when I move epsilon
% so if the lambda was 0 that means the constraint is not operative
%%Note if I had 2 linear constraints x<2 and x<3 then the value for lambda
%%should be the same as x<2 since the second constrain is not active.
%%Now I add the non linear constrain 

%% x^2<y

nl=@nonl
x0=[0,0]
f7([0,0])

[x,fval,exitflag,output,lambda] = fmincon(f7,x0,A,b,[],[],[],[],nl,options)
lambda
%%%%

%% 

%%%Exercise 6:
x0=rand(1,10)

f6=@ex6_obj
options = optimoptions('fminunc','Display','iter','CheckGradients',true);

tic
[x,fval,exitflag,output,lambda] = fminunc(f6,x0,options)
toc

%% 

%%I try an x0 of size 10000:
x0=rand(1,1000)

tic
[x,fval,exitflag,output,lambda] = fminunc(f6,x0,options)
toc
x,fval

lambda 
%% 

%%Using lsqnonlin
x0 = rand(1,10)
f7=@ex6_lsq

tic
[x,resnorm,residual,jacobian]=lsqnonlin(f7,x0)
toc

%% 

tic
n = 1000;
e = ones(n,1);
x0 = rand(1,1000)

%Jstr = spdiags([e e e],-1:1,2*n,n)
%Jstr= ones([2000,1000]);% if its all in ones it wont help
Jstr= zeros([2000,1000]);% I can piut all zeros and then update it with for loop putting 1s where it is

options=optimoptions('lsqnonlin','JacobPattern',Jstr)

tic
[x,resnorm,residual,jacobian] = lsqnonlin(f7,x0,[],[],options)
toc

