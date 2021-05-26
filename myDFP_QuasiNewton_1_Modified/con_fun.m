%%Seyyed Ali Sadat
%%Sasadat@ieee.org
%% Constraint function
function [h,g] = con_fun(x)
h(1) = 0;
g(1) = x(1)^2 + x(2)^2 + x(3)^2 + x(4)^2 + x(1) - x(2) + x(3) - x(4) - 100;
g(2) = x(1)^2 + 2*x(2)^2 + x(3)^2 + 2*x(4)^2 - x(1) - x(4) - 10;
g(3) = 2*x(1)^2 + x(2)^2 + x(3)^2 - 2*x(1) - x(2) - x(4) - 5;