%%Seyyed Ali Sadat
%%Sasadat@ieee.org
%% Numerical drivatice calculation
% First derivative of penalty function using central differencing
function deriv = grad_vec(x,delx,n_of_var,scale_factor)
deriv = zeros(1,n_of_var);
for i = 1:n_of_var
    xvec = x;
    xvec1 = x;
    xvec(i) = x(i) + delx;
    xvec1(i) = x(i) - delx;
    deriv(i) = (penalty_fun(xvec,scale_factor) - penalty_fun(xvec1,scale_factor) )/(2*delx);
end

