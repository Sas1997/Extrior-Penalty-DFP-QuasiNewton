%%Seyyed Ali Sadat
%%Sasadat@ieee.org
%% Quasi Newton optimization method
%  One dimentional non gradient direct serach method
function [alpha,falpha] = quasiNewton_fun(x,search,scale_factor)
epsilon1 = 1e-3;
epsilon2 = 1e-3;
alpha = 0.1; 
delx = 0.01;
xm = x;
for i = 1:50
    xf = xm + delx;
    xb = xm - delx;
    
    derivative = (penalty_fun(xf,scale_factor) - penalty_fun(xb,scale_factor) )/(2*delx);
    sec_derivative = (penalty_fun(xf,scale_factor) + penalty_fun(xb,scale_factor) ... 
                                                   - 2*penalty_fun(xm,scale_factor))/((delx)*(delx));
    alpha_prev = alpha;
    xm = xm - derivative/sec_derivative;
    alpha = search*(x - xm)'/(search*search');
    falpha =  penalty_fun(x + alpha*search,scale_factor);
    
    if abs(alpha - alpha_prev) < epsilon1 || norm(derivative) < epsilon2
        break;
    end
end
