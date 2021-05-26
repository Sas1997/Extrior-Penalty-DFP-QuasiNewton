%%Seyyed Ali Sadat
%%Sasadat@ieee.org
%% Main Program
%  Solving constraint nonlinear optimization problem 
%% 
clc, clear all, warning off all, close all
%% Basic step 
X0 = zeros(1,4);
Xmin = -100;
Xmax =  100;
opt = optimset('LargeScale','off','Display','iter' ...
              ,'TolX',1e-6,'TolFun',1e-6);  % set OPTIONS 
tic; % timer strat          
[X, fval] = fmincon('obj_fun',X0,[],[],[],[],Xmin,Xmax,'con_fun',opt);  % CALL BASIC function
time = toc;
%% print results
clc
fprintf('------------Optimzation results -------------------------------\n ')
fprintf('               x-vector                  f(x)   \n')
fprintf('__________________________________________________\n')
fprintf('%8.3f %8.3f %8.3f %8.3f %9.0f\n',X,fval)
fprintf('__________________________________________________\n')
fprintf('Elapsed time = %4.2f [sec]\n',time)

