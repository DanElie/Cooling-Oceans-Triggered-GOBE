%%

yi = [yi]'; 

[r1,Fc1,p1, ddl1]=pearsonm(yi,  [Laurentia.mediane]')
% figure
% scatter( [Laurentia.mediane],yi, 100,'filled')
% xlabel('pseudospecies')
% ylabel('fossil diversity')
% t1 =text(6800, 80, {'r =' num2str(r,2)})
% t2 =text(6800, 55, {'p =' num2str(p,2)})
% t1.FontSize = 16
% t2.FontSize = 16
% title({'r1 = ' num2str(r,2) 'p1 = ' num2str(p)})
% grid on

%%

y2 = [y2]';

[r2,Fc2,p2, ddl2]=pearsonm(y2,  [Siberia.mediane]')
% figure
% scatter( [Siberia.mediane],y2, 100,'filled')
% xlabel('pseudospecies')
% ylabel('fossil diversity')
% t1 =text(6800, 80, {'r =' num2str(r,2)})
% t2 =text(6800, 55, {'p =' num2str(p,2)})
% t1.FontSize = 16
% t2.FontSize = 16
% title({'r2 = ' num2str(r,2) 'p2 = ' num2str(p)})
% grid on

%%

y3 = [y3]';

[r3,Fc3,p3, ddl3]=pearsonm(y3,  [SouthChina.mediane]')
% figure
% scatter( [SouthChina.mediane],y3, 100,'filled')
% xlabel('pseudospecies')
% ylabel('fossil diversity')
% t1 =text(6800, 80, {'r =' num2str(r,2)})
% t2 =text(6800, 55, {'p =' num2str(p,2)})
% t1.FontSize = 16
% t2.FontSize = 16
% title({'r = ' num2str(r,2) 'p = ' num2str(p)})
% grid on

%%

y4 = [y4]';

[r4,Fc4,p4, ddl4]=pearsonm(y4,  [Baltica.mediane]')
% figure
% scatter( [Baltica.mediane],y4, 100,'filled')
% xlabel('pseudospecies')
% ylabel('fossil diversity')
% t1 =text(6800, 80, {'r =' num2str(r,2)})
% t2 =text(6800, 55, {'p =' num2str(p,2)})
% t1.FontSize = 16
% t2.FontSize = 16
% title({'r = ' num2str(r,2) 'p = ' num2str(p)})
% grid on

%%
PalaeoContinent = ["Laurentia";"Siberia";"SouthChina";"Baltica"];
Correlation = [r1; r2; r3; r4];
Tableau = table(PalaeoContinent, Correlation);

fig = uifigure;
uitable(fig, 'Data',Tableau)
