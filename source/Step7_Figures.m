%% Step 7 Figures Biodiversity Curves;
%we create the diversity curves from our pseudospecies

%% Load fossil data Global

load donnees_paleo_ordovicien.mat

xi= [-490:10:-430];

X2= [Fandonnesdiv.temps];
Y2= [Fandonnesdiv.diversitegenre];
y2 =interp1(X2, Y2, xi);

X3= [Septoskidonnesdiv.temps];
Y3= [Septoskidonnesdiv.diversitegenre];
y3 =interp1(X3, Y3, xi);

X4= [Rasmussendonnesdiv.temps];
Y4= [Rasmussendonnesdiv.diversitegenre];
y4 =interp1(X4, Y4, xi);

%% Colors

bleu = [0 0 1];
gris = [0.6 0.6 0.6];
gris2 = [0.3 0.3 0.35];
jaune = [0.9290 0.6940 0.1250];

%% Create the enveloppe

for i = 1:7
    Song(i).mini = Song(i).mediane- Song(i).sd;
    Song(i).maxi = Song(i).mediane+ Song(i).sd;
end

for i = 1:7
    Cst8PAL(i).mini = Cst8PAL(i).mediane- Cst8PAL(i).sd;
    Cst8PAL(i).maxi = Cst8PAL(i).mediane+ Cst8PAL(i).sd;
end
%% Figure
if detrended_Climate == 'n'
    figure('Units', 'centimeters', 'Position', [1,1,15,12], 'PaperType', 'a4');
    colororder({'k','k'})
    yyaxis left
    p1=plot_shade([xi]', [Song.mini]', [Song.mediane]', [Song.maxi]', 0.4, gris, 2);
    p1.Marker =".";
    p1.MarkerSize = 40;
    xlabel('Geological time (Ma)');
    ylabel('Model biodiversity (# species)');
    set(gca,'FontSize',16);
    
    yyaxis right
    hold on
    p2 = plot(X2, Y2/max(Y2));
    p2.LineWidth = 1.2;
    p2.LineStyle = '--';
    
    p3 = plot(X3, Y3/max(Y3));
    p3.LineWidth = 1.2;
    p3.LineStyle = '-.';
    p4 = plot(X4, Y4/max(Y4));
    p4.LineWidth = 1.75;
    p4.LineStyle = ':';
    ylabel('Normalized fossil diversity');
    
    xlim([-500 -425]);
    ylim([0 1.1])
    
else
    
    figure('Units', 'centimeters', 'Position', [1,1,15,12], 'PaperType', 'a4');
    colororder({'k','k'})
    yyaxis left
    hold on
    p1=plot_shade([xi]', [Song.mini]', [Song.mediane]', [Song.maxi]', 0.4, gris, 2);
    p1.Marker =".";
    p1.MarkerSize = 40;
    p2=plot_shade([xi]', [Cst8PAL.mini]', [Cst8PAL.mediane]', [Cst8PAL.maxi]', 0.4, gris2, 2);
    p2.Marker =".";
    p2.MarkerSize = 40;
    xlabel('Geological times (Ma)');
    ylabel('Model biodiversity (# species)');
    set(gca,'FontSize',16);
    
    yyaxis right
    hold on
    p3 = plot(X2, Y2/max(Y2));
    p3.LineWidth = 1.2;
    p3.LineStyle = '--';
    
    p4 = plot(X3, Y3/max(Y3));
    p4.LineWidth = 1.2;
    p4.LineStyle = '-.';
    p5 = plot(X4, Y4/max(Y4));
    p5.LineWidth = 1.75;
    p5.LineStyle = ':';
    ylabel('Normalized fossil diversity');
    
    xlim([-500 -425]);
    ylim([0 1.1])
end
%% Figure for allopatry
% 
% 
% for i = 1:7
%     Song(i).mini_allop = Song(i).nb_allop - Song(i).sd_allop;
%     Song(i).maxi_allop = Song(i).nb_allop + Song(i).sd_allop;
% end
% 
% figure('Units', 'centimeters', 'Position', [1,1,15,12], 'PaperType', 'a4');
% colororder({'k','k'})
% yyaxis left
% p1=plot_shade([xi]', [Song.mini_allop]', [Song.nb_allop]', [Song.maxi_allop]', 0.4, gris, 2);
% p1.Marker =".";
% p1.MarkerSize = 40;
% xlabel('Geological times (Ma)');
% ylabel('Model biodiversity (# species)');
% set(gca,'FontSize',16);
% 
% yyaxis right
% hold on
% p2 = plot(X2, Y2/max(Y2));
% p2.LineWidth = 1.2;
% p2.LineStyle = '--';
% 
% p3 = plot(X3, Y3/max(Y3));
% p3.LineWidth = 1.2;
% p3.LineStyle = '-.';
% p4 = plot(X4, Y4/max(Y4));
% p4.LineWidth = 1.75;
% p4.LineStyle = ':';
% ylabel('Normalized fossil diversity');
% 
% xlim([-500 -425]);
% ylim([0 1.1])

%% save figure
exportgraphics(gcf,'GlobalCurve_Song.tif','Resolution',300)
