%%Seyyed Ali Sadat
%%Sasadat@ieee.org
%% Main Program
% Solving nonlinear constraint optimization problem
% using Davidon,Fletcher,Powell (DFP) exterior penalty function algorithm
%% start
clc, clear all, warning off all, close all
%% Define variables and agents
n_of_var = 4;         % No. of design variables
epsilon1 = 1e-6;      % Convergence parameter
epsilon2 = 1e-6;      % Convergence parameter
delx = 1e-6;          % Step length for numerical derivative
scale_factor = 0.2;   % Scale factor in constraint violation calculation
maxIter = 5000;         % Maximum iteration number
% Input VECTOR of start point
xo = [0,0,0,0; 1,0,0,0; 0,1,0,0; 0,0,1,0; 0,0,0,1; 1, 1, 2, -1];
% diary('QuasiNewton_Optim_Results.txt'); % Save records
fprintf('----------------------------------------- DFP Optimization Results ----------------------------------------------\n ')
fprintf(' k      rk                     xo                Iter. No.                  x                 Penalty(x)   f(x) \n')
fprintf('_________________________________________________________________________________________________________________\n')
%% Strat of iteration
for k = 1:size(xo,1)
    x = xo(k,:);
    A = eye(length(x));   % Initla Hessain matrix
    falpha_prev = penalty_fun(x,scale_factor);  % Initial penalty function value
    [hh, gg]    = con_fun(x);                   % Initial constraint function value
    for i = 1:maxIter
        [hh,gg] = con_fun(x);                                     % Call constraint function
        f = obj_fun(x);                                           % Call objective function
        scale_factor = max(1,1/norm([hh gg]));                    % Set Scale factor
        if i == 1
            deriv_prev = grad_vec(x,delx,n_of_var,scale_factor);  % Gradient vector calculation of penalty function
            search     = -deriv_prev;                             % Set search direction
            [alpha,falpha] = newton_fun(x,search,scale_factor,n_of_var);
            if abs(falpha - falpha_prev) < epsilon1               % Check convergence criteria
                break;
            end
            falpha_prev = falpha;                                 % Reserve the golden search result
            x = x + alpha*search;                                 % Update the design vector
        else
            deltax = (alpha*search);                              % Compute the deltax
            if i > 2
                deltax = deltax';
            end
            deriv  = grad_vec(x,delx,n_of_var,scale_factor);      % Compute the gradient of penalty function
            deltag = deriv - deriv_prev;                          % Compute the gradient of penalty function
            term1  = (deltax'*deltax)/(deltax*deltag');           % Compute term1 for updating the hessian
            term2  = (A*deltag'*deltag*A)/(deltag*A*deltag');     % Compute term2 for updating the hessian
            A = A + term1 - term2;                                % Update Hessian matrix
            search = -A*deriv';                                   % Update serach direction
            [alpha,falpha] = newton_fun(x,search',scale_factor,n_of_var);
            x = x + alpha*search';                                % Update the design vector
            if abs(falpha - falpha_prev) < epsilon1 || norm(deriv) < epsilon2  % Check convergence criteria
                break;
            end
            %
            falpha_prev = falpha;                                 % Reserve the golden search result
            deriv_prev  = deriv;                                  % Reserve the the derivative
        end
    end
    %%
    fprintf('%3d  |  %4.2f  | %6.3f %8.3f %8.3f %8.3f |  %3d  | %6.3f %8.3f %8.3f %8.3f | %7.3f | %7.3f\n',k,scale_factor,xo(k,:),i,x,falpha,f)
end
fprintf('_________________________________________________________________________________________________________________\n')
%%
% diary off

