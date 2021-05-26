function newsol=mutation_insertion(sol,lb,ub)
nvar=length(sol);
j=randi([1 nvar]);
sol(j)=unifrnd(lb(1),ub(1));
newsol=sol;
end