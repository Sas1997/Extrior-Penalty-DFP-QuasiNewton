function newsol=mutation_swap(sol)

nvar=length(sol);
out=randsample(nvar,2);
i=out(1);
j=out(2);
newsol=sol;
newsol(i)=sol(j);
newsol(j)=sol(i);
end
