function newsol=mutation_inversion(sol)

nvar=length(sol);
rad1=randi([1 nvar]);
rad2=randi([1 nvar]);
i=min([rad1 rad2]);
j=max([rad1 rad2]);
newsol=sol;
newsol(i:j)=sol(j:-1:i);

end