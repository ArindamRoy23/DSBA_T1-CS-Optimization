clear all;
close all;

options = optimoptions('fminunc');
options = optimoptions(options, 'Display','iter','MaxFunctionEvaluations',1000,'StepTolerance',exp(-10) ...
    ,'SpecifyObjectiveGradient',true);

x0 =[0;10];

fprintf('x0 = (%.2f, %.2f), f = %f\n', x0(1), x0(2), myobj1(x0));

xsol = fminunc(@(x)myobj1(x), x0, options);

fprintf('final solution = (%.2f, %.2f), f = %f\n', xsol(1), xsol(2), myobj1(xsol));

x = 0:.1:10;
y = -1:.1:10;

[xx,yy] = meshgrid(x,y);

zz = zeros(size(xx));

for i = 1:length(xx(:))
    zz(i) = myobj1([xx(i),yy(i)]);
end

%2d image

figure(1);
imagesc(x,y,zz);
colorbar;
axis xy
xlabel('x'); ylabel('y');

%3d image

figure(2);
mesh(x,y,zz);
colormap pink
shading flat
xlabel('x'); ylabel('y');



                        