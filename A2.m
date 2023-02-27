clear all; % clear memory
close all; % close figures
options = optimoptions('fminunc');
options = optimoptions(options,'Display','iter',...
'MaxFunctionEvaluations',1000,'StepTolerance',1e-10,...
'SpecifyObjectiveGradient',true,'CheckGradients',true);