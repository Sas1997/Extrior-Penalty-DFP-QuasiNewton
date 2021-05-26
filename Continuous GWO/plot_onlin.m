function plot_onlin(pos,f)

figure(3)

x=pos(:,1);
y=pos(:,2);


plot3(x,y,f,'k.',...
    'MarkerSize',14)
%pause(5)

end