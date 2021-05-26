%%Seyyed Ali Sadat
%%Sasadat@ieee.org
function [c,ceq] = con_fun(x)
ceq(1) = 0;
c(1) = x(1)^2 + x(2)^2 + x(3)^2 + x(4)^2 + x(1) - x(2) + x(3) - x(4) - 100;
c(2) = x(1)^2 + 2*x(2)^2 + x(3)^2 + 2*x(4)^2 - x(1) - x(4) - 10;
c(3) = 2*x(1)^2 + x(2)^2 + x(3)^2 - 2*x(1) - x(2) - x(4) - 5;