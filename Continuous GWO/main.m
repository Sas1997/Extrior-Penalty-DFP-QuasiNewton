clc
clear
close all
%% setting and run GWO
dim=2;
SearchAgents_no=50; % Number of search agents
Max_iteration=100; % Maximum number of iterations
lb=-10;
ub=10;
fobj=@fitness;
figure(4)
PlotFun(lb,ub);

[Best_score,Best_pos,GWO_cg_curve]=GWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);


%% plot reult
figure
semilogy(GWO_cg_curve,'Color','r')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
legend('GWO')

%% print reult
display(['The best solution obtained by GWO is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by GWO is : ', num2str(Best_score)]);

        



