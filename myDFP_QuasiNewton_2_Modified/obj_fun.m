%%Seyyed Ali Sadat
%%Sasadat@ieee.org
%% Objective function
function y = obj_fun(x)
y = x(1)^2 + x(2)^2 + 2*x(3)^2 - x(4)^2 ...
  - 5*x(1) - 5*x(2) - 21*x(3) + 7*x(4) + 100;