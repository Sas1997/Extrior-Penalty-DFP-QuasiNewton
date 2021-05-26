%%Seyyed Ali Sadat
%%Sasadat@ieee.org
function y = penalty_fun(x,scale_factor)

y = obj_fun(x); % Call objective function

penalty = 0.0;
[h,g] = con_fun(x); % Call objective function
for i = 1:length(h)
    if h(i) ~= 0
        penalty = penalty + h(i)^2;
    end
end
for i = 1:length(g)
    if g(i) > 0
        penalty = penalty + g(i)^2;
    end
end
y = y + penalty*scale_factor; % Calc penalty value



