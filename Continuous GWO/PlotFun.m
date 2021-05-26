

function PlotFun(lb,ub)



x=lb(1):0.2:ub(1);
y=lb(1):0.2:ub(1);
L=length(x);
f=[];

for i=1:L
    for j=1:L
        
        f(i,j)=fitness([x(i),y(j)]);
        
    end
end

surfc(x,y,f,'LineStyle','none');
title("");
xlabel('x');
ylabel('y');
zlabel('f(x,y)');

end

