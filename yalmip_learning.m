% clear workspace and command lines
clear;
clc;
clear all;

% set the decision variables
x = sdpvar(1,2);
y = intvar(1,1);

% constraints
C = [x(1) + x(2) >= 2
    x(2) - x(1) <= 1 
    x(1)<=1
    y(1) >= 1];

% set solver
ops = sdpsettings();

% objective function
z = -(x(1)+2*x(2))/(2*x(1)+x(2))+y; 

% solve
reuslt = optimize(C,z,ops);  

% successfully solved
if reuslt.problem == 0 
    value(x)
    value(y)
    -value(z)   
else
    disp('Wrong!');
end
