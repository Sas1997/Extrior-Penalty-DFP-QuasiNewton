%%Seyyed Ali Sadat
%%Sasadat@ieee.org
%% computting the hessian matrix
function sec_deriv = hessian_fun(x,delx,n_of_var,scale_factor)
for i = 1:n_of_var % length(x)
    for j = 1:n_of_var % length(x)
        if i == j
            temp = x;
            temp(i) = x(i) + delx;
            term1 = penalty_fun(temp,scale_factor);
            temp(i) = x(i) - delx;
            term2 = penalty_fun(temp,scale_factor);
            term3 = penalty_fun(temp,scale_factor);
            
            sec_deriv(i,j) = (term1 - 2*term3 + term2)/(delx^2);
        else
            temp = x;
            temp(i) = x(i) + delx;
            temp(j) = x(j) + delx;
            term1 = penalty_fun(temp,scale_factor);
            
            temp = x;
            temp(i) = x(i) + delx;
            temp(j) = x(j) - delx;
            term2 = penalty_fun(temp,scale_factor);
            
            temp = x;
            temp(i) = x(i) - delx;
            temp(j) = x(j) + delx;
            term3 = penalty_fun(temp,scale_factor);
            
            temp = x;
            temp(i) = x(i) - delx;
            temp(j) = x(j) - delx;
            term4 = penalty_fun(temp,scale_factor);
            
            sec_deriv(i,j) = (term1 - term2 - term3 + term4)/(4*delx^2);
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
