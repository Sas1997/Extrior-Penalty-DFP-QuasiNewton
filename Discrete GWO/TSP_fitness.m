function [z,sol]=TSP_fitness(x,model)

    D=model.matrix_distance;
    [~, sol]=sort(x);

    z=0;
    
    if isempty(sol)
        return;
    end
    
    sol=[sol sol(1)];
    for i=1:numel(sol)-1
        z=z+D(sol(i),sol(i+1));
    end

end