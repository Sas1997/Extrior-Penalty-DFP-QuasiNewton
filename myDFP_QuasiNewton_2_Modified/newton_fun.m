%%Seyyed Ali Sadat
%%Sasadat@ieee.org
%% Quasi-Newton

function [alpha,falpha] = newton_fun(x,search,scale_factor,n_of_var)
epsilon1 = 1e-3;
epsilon2 = 1e-3;
delx = 0.00075;
xp = x; 
alpha_prev = 0.1;
%% main iteration loop
for i = 1:50
    deriv = grad_vec(x,delx,n_of_var,scale_factor);
    sec_deriv = hessian_fun(x,delx,n_of_var,scale_factor);
    x = (x' - sec_deriv\deriv')';
    alpha = search*(xp - x)'/(search*search');
    falpha = penalty_fun(x,scale_factor); 
    if abs(alpha - alpha_prev) < epsilon1 || norm(deriv) < epsilon2
        break;
    else
        alpha_prev = alpha;
    end    
end
