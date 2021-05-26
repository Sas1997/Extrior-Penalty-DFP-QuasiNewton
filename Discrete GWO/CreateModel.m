function model=CreateModel(n)

%     x=[57 36 11 19 76 77 71 33 58 33 6 76 93 38 86 98 40 28 48 68]';
%     y=[9 90 42 42 90 95 32 60 24 59 61 11 3 32 43 36 45 52 96 60]';پ
 
    
%     position=[x y];
    
    position=randi([1 100],n,2);
    D=pdist2(position,position);
    
    model.count_city=n;
    model.matrix_distance=D;
    model.x=position(:,1);
    model.y=position(:,2);
    
end