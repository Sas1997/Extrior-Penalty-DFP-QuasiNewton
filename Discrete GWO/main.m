clc
clear
close all

%%
prompt = {'Enter Number of City:'};
dlgtitle = 'Input';
dims =[1 50];
definput = {'10'};
answer = inputdlg(prompt,dlgtitle,dims,definput);
n=str2num(answer{1});
%% setting and run GWO
SearchAgents_no=100; % Number of search agents
Max_iteration=1000; % Maximum numbef of iterations
lb=-10;
ub=10;
TSP_model=CreateModel(n);
dim=TSP_model.count_city; 
fobj=@(x) TSP_fitness(x,TSP_model);


[Best_score,Best_pos,GWO_cg_curve]=GWO_modified(SearchAgents_no,Max_iteration,lb,ub,dim,fobj,TSP_model);


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
[~,Tour_find]=fobj(Best_pos);
display(['The best solution obtained by GWO is : ', num2str(Tour_find)]);
display(['The best optimal value of the objective funciton found by GWO is : ', num2str(Best_score)]);

        



