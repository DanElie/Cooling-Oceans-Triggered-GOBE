%%

load Paleoprovinces.mat
load donnees_Baltica_Harper.mat
load donnees_Laurentia_Harper.mat
load donnees_Siberia_Harper.mat
load donnees_SouthChina_Harper.mat
load donnees_Marine_Harper.mat

%% Colors

% rouge = [0.8500, 0.3250, 0.0980];
% jaune = [0.9290, 0.6940, 0.1250];
% bleu = [0, 0.4470, 0.7410];
% vert = [0.4660, 0.6740, 0.1880];
gris = [0.6, 0.6, 0.6];

x2 = (-490:10:-440);

%%

[n,p] = size(Song(1).MATDEF);

for i = 1:7
    zz = Song(i).MATDEF;
    lau1 = Laurentia(i).mask;   
    lau2 = nan(n,p);
    lau2(lau1 == 1) = zz(lau1 ==1);
    Laurentia(i).MATDEF = lau2;
    
    bal1 = Baltica(i).mask;   
    bal2 = nan(n,p);
    bal2(bal1 == 0) = zz(bal1 ==0);
    Baltica(i).MATDEF = bal2;   
    
    sib1 = Siberia(i).mask;   
    sib2 = nan(n,p);
    sib2(sib1 == 1) = zz(sib1 ==1);
    Siberia(i).MATDEF = sib2;
    
    sou1 = SouthChina(i).mask;   
    sou2 = nan(n,p);
    sou2(sou1 == 1) = zz(sou1 ==1);
    SouthChina(i).MATDEF = sou2;
    
    clear lau1 lau2 bal1 bal2 sib1 sib2 sou1 sou2 zz
end

for i = 1:7
    a = Laurentia(i).MATDEF;
    a = a(:);
    a(isnan(a) == 1) = [];
    Laurentia(i).mediane = median(a);
    Laurentia(i).sd = std(a);
    Laurentia(i).mini = Laurentia(i).mediane - Laurentia(i).sd;
    Laurentia(i).maxi = Laurentia(i).mediane + Laurentia(i).sd;
    clear a
end

for i = 1:7
    a = Baltica(i).MATDEF;
    a = a(:);
    a(isnan(a) == 1) = [];
    Baltica(i).mediane = median(a);
    Baltica(i).sd = std(a);
    Baltica(i).mini = Baltica(i).mediane - Baltica(i).sd;
    Baltica(i).maxi = Baltica(i).mediane + Baltica(i).sd;
    clear a
end

for i = 1:7
    a = Siberia(i).MATDEF;
    a = a(:);
    a(isnan(a) == 1) = [];
    Siberia(i).mediane = median(a);
    Siberia(i).sd = std(a);
    Siberia(i).mini = Siberia(i).mediane - Siberia(i).sd;
    Siberia(i).maxi = Siberia(i).mediane + Siberia(i).sd;
    clear a
end

for i = 1:7
    a = SouthChina(i).MATDEF;
    a = a(:);
    a(isnan(a) == 1) = [];
    SouthChina(i).mediane = median(a);
    SouthChina(i).sd = std(a);
    SouthChina(i).mini = SouthChina(i).mediane - SouthChina(i).sd;
    SouthChina(i).maxi = SouthChina(i).mediane + SouthChina(i).sd;
    clear a
end

%% Same but for detrended climate (12x)

for i = 1:7
    zz = Cst8PAL(i).MATDEF;
    lau1 = Laurentia(i).mask;   
    lau2 = nan(n,p);
    lau2(lau1 == 1) = zz(lau1 ==1);
    Laurentia(i).MATDEF2 = lau2;
    
    bal1 = Baltica(i).mask;   
    bal2 = nan(n,p);
    bal2(bal1 == 0) = zz(bal1 ==0);
    Baltica(i).MATDEF2 = bal2;   
    
    sib1 = Siberia(i).mask;   
    sib2 = nan(n,p);
    sib2(sib1 == 1) = zz(sib1 ==1);
    Siberia(i).MATDEF2 = sib2;
    
    sou1 = SouthChina(i).mask;   
    sou2 = nan(n,p);
    sou2(sou1 == 1) = zz(sou1 ==1);
    SouthChina(i).MATDEF2 = sou2;
    
    clear lau1 lau2 bal1 bal2 sib1 sib2 sou1 sou2 zz
end

for i = 1:7
    a = Laurentia(i).MATDEF2;
    a = a(:);
    a(isnan(a) == 1) = [];
    Laurentia(i).mediane2 = median(a);
    Laurentia(i).sd2 = std(a);
    Laurentia(i).mini2 = Laurentia(i).mediane2 - Laurentia(i).sd2;
    Laurentia(i).maxi2 = Laurentia(i).mediane2 + Laurentia(i).sd2;
    clear a
end

for i = 1:7
    a = Baltica(i).MATDEF2;
    a = a(:);
    a(isnan(a) == 1) = [];
    Baltica(i).mediane2 = median(a);
    Baltica(i).sd2 = std(a);
    Baltica(i).mini2 = Baltica(i).mediane2 - Baltica(i).sd2;
    Baltica(i).maxi2 = Baltica(i).mediane2 + Baltica(i).sd2;
    clear a
end
Baltica(7) = [];


for i = 1:7
    a = Siberia(i).MATDEF2;
    a = a(:);
    a(isnan(a) == 1) = [];
    Siberia(i).mediane2 = median(a);
    Siberia(i).sd2 = std(a);
    Siberia(i).mini2 = Siberia(i).mediane2 - Siberia(i).sd2;
    Siberia(i).maxi2 = Siberia(i).mediane2 + Siberia(i).sd2;
    clear a
end

for i = 1:7
    a = SouthChina(i).MATDEF2;
    a = a(:);
    a(isnan(a) == 1) = [];
    SouthChina(i).mediane2 = median(a);
    SouthChina(i).sd2 = std(a);
    SouthChina(i).mini2 = SouthChina(i).mediane2 - SouthChina(i).sd2;
    SouthChina(i).maxi2 = SouthChina(i).mediane2 + SouthChina(i).sd2;
    clear a
end

%%
if fossils == 'bra';
    xi= [-490:10:-430];
    X1= [HarperLaurentiaBrachiopodes.temps];
    Y1= [HarperLaurentiaBrachiopodes.diversitegenre];
    yi=interp1(X1, Y1, xi);
    
    X2= [HarperSiberiaBrachiopodes.temps];
    Y2= [HarperSiberiaBrachiopodes.diversitegenre];
    y2=interp1(X2, Y2, xi);
    
    X3= [HarperSouthChinaBrachiopodes.temps];
    Y3= [HarperSouthChinaBrachiopodes.diversitegenre];
    y3=interp1(X3, Y3, xi);
    
    X4= [HarperBalticaBrachiopodes.temps];
    Y4= [HarperBalticaBrachiopodes.diversitegenre];
    y4=interp1(X4, Y4, x2);
    
elseif fossils == 'tri';
    
    xi= [-490:10:-430];
    X1= [HarperLaurentiaTribolites.temps];
    Y1= [HarperLaurentiaTribolites.diversitegenre];
    yi=interp1(X1, Y1, xi);
    
    X2= [HarperSiberiaTribolites.temps];
    Y2= [HarperSiberiaTribolites.diversitegenre];
    y2=interp1(X2, Y2, xi);
    
    X3= [HarperSouthChinaTrilobites.temps];
    Y3= [HarperSouthChinaTrilobites.diversitegenre];
    y3=interp1(X3, Y3, xi);
    
    X4= [HarperBalticaTribolites.temps];
    Y4= [HarperBalticaTribolites.diversitegenre];
    y4=interp1(X4, Y4, x2);
    
elseif fossils == 'con';
    
    xi= [-490:10:-430];
    X1= [HarperLaurentiaConodonthes.temps];
    Y1= [HarperLaurentiaConodonthes.diversitegenre];
    yi=interp1(X1, Y1, xi);
    
    X2= [HarperSiberiaConodonthes.temps];
    Y2= [HarperSiberiaConodonthes.diversitegenre];
    y2=interp1(X2, Y2, xi);
    
    X3= [HarperSouthChinaConodontes.temps];
    Y3= [HarperSouthChinaConodontes.diversitegenre];
    y3=interp1(X3, Y3, xi);
    
    X4= [HarperBalticaConodonthes.temps];
    Y4= [HarperBalticaConodonthes.diversitegenre];
    y4=interp1(X4, Y4, x2);
    
else
    xi= [-490:10:-430];
    X1= [HarperLaurentiaMarine.temps];
    Y1= [HarperLaurentiaMarine.diversitegenre];
    yi=interp1(X1, Y1, xi);
    
    X2= [HarperSiberiaMarine.temps];
    Y2= [HarperSiberiaMarine.diversitegenre];
    y2=interp1(X2, Y2, xi);
    
    X3= [HarperSouthChinaMarine.temps];
    Y3= [HarperSouthChinaMarine.diversitegenre];
    y3=interp1(X3, Y3, xi);
    
    X4= [HarperBalticaMarine.temps];
    Y4= [HarperBalticaMarine.diversitegenre];
    y4=interp1(X4, Y4, x2);
end


%%
if detrended_Climate == 'n';
    
    figure('Units', 'centimeters', 'Position', [1,1,14,12.4], 'PaperType', 'a4');
    t=tiledlayout(2, 2, 'TileSpacing', 'compact');
    
    nexttile;
    colororder({'k','k'})
    yyaxis left
    p1 = plot_shade([xi]', [Laurentia.mini]', [Laurentia.mediane]', [Laurentia.maxi]', 0.4, orange, 2);
    p1.Marker = '.';
    p1.MarkerSize = 20;
    xlabel('geological times');
    ylabel('pseudospecies');
    ylim([0 5700]);
    yyaxis right;
    p2 = plot(xi, yi);
    p2.LineWidth = 1.5;
    title('Laurentia');
    set(gca,'FontSize',8);
    
    nexttile;
    colororder({'k','k'})
    yyaxis left
    p1 =plot_shade([xi]', [Siberia.mini]', [Siberia.mediane]', [Siberia.maxi]', 0.4, jaune, 2);
    p1.Marker = '.';
    p1.MarkerSize = 20;
    xlabel('geological times')
    ylabel('pseudospecies')
    ylim([0 5700]);
    yyaxis right;
    p2 = plot(xi, y2);
    p2.LineWidth = 1.5;
    title('Siberia');
    set(gca,'FontSize',8);
    
    nexttile;
    colororder({'k','k'})
    yyaxis left
    p1 = plot_shade([xi]', [SouthChina.mini]', [SouthChina.mediane]', [SouthChina.maxi]', 0.4, vert, 2);
    p1.Marker = '.';
    p1.MarkerSize = 20;
    xlabel('geological times')
    ylabel('pseudospecies')
    ylim([0 5700]);
    yyaxis right;
    p2 = plot(xi, y3);
    p2.LineWidth = 1.5;
    title('SouthChina');
    set(gca,'FontSize',8);
    
    nexttile;
    colororder({'k','k'})
    yyaxis left
    p1 = plot_shade([x2]', [Baltica.mini]', [Baltica.mediane]', [Baltica.maxi]', 0.4, bleu, 2);
    p1.Marker = '.';
    p1.MarkerSize = 20;
    xlabel('geological times')
    ylabel('pseudospecies')
    % ylim([1 6000]);
    ylim([0 5700]);
    yyaxis right;
    p2 = plot(x2, y4);
    p2.LineWidth = 1.5;
    title('Baltica');
    set(gca,'FontSize',8);

else
    
    figure('Units', 'centimeters', 'Position', [1,1,14,12.4], 'PaperType', 'a4');
    t=tiledlayout(2, 2, 'TileSpacing', 'compact');
    
    nexttile;
    hold on
    colororder({'k','k'})
    yyaxis left
    p1 = plot_shade([xi]', [Laurentia.mini]', [Laurentia.mediane]', [Laurentia.maxi]', 0.4, orange, 2);
    p1.Marker = '.';
    p1.MarkerSize = 20;
    p2 = plot_shade([xi]', [Laurentia.mini2]', [Laurentia.mediane2]', [Laurentia.maxi2]', 0.4, gris2, 2);
    p2.Marker = '.';
    p2.MarkerSize = 20;
    
    xlabel('geological times');
    ylabel('pseudospecies');
    ylim([0 5700]);
    
    yyaxis right;
    p3 = plot(xi, yi);
    p3.LineWidth = 1.5;
    title('Laurentia');
    set(gca,'FontSize',8);
    
    nexttile;
    hold on
    colororder({'k','k'})
    yyaxis left
    p1 =plot_shade([xi]', [Siberia.mini]', [Siberia.mediane]', [Siberia.maxi]', 0.4, jaune, 2);
    p1.Marker = '.';
    p1.MarkerSize = 20;
    p2 =plot_shade([xi]', [Siberia.mini2]', [Siberia.mediane2]', [Siberia.maxi2]', 0.4, gris2, 2);
    p2.Marker = '.';
    p2.MarkerSize = 20;
    xlabel('geological times')
    ylabel('pseudospecies')
    ylim([0 5700]);
    yyaxis right;
    p3 = plot(xi, y2);
    p3.LineWidth = 1.5;
    title('Siberia');
    set(gca,'FontSize',8);
    
    nexttile;
    hold on
    colororder({'k','k'})
    yyaxis left
    p1 = plot_shade([xi]', [SouthChina.mini]', [SouthChina.mediane]', [SouthChina.maxi]', 0.4, vert, 2);
    p1.Marker = '.';
    p1.MarkerSize = 20;
    p2 = plot_shade([xi]', [SouthChina.mini2]', [SouthChina.mediane2]', [SouthChina.maxi2]', 0.4, gris2, 2);
    p2.Marker = '.';
    p2.MarkerSize = 20;

    xlabel('geological times')
    ylabel('pseudospecies')
    ylim([0 5700]);
    yyaxis right;
    p3 = plot(xi, y3);
    p3.LineWidth = 1.5;
    title('SouthChina');
    set(gca,'FontSize',8);
    
    nexttile;
    hold on
    colororder({'k','k'})
    yyaxis left
    p1 = plot_shade([x2]', [Baltica.mini]', [Baltica.mediane]', [Baltica.maxi]', 0.4, bleu, 2);
    p1.Marker = '.';
    p1.MarkerSize = 20;
    p1 = plot_shade([x2]', [Baltica.mini2]', [Baltica.mediane2]', [Baltica.maxi2]', 0.4, gris2, 2);
    p1.Marker = '.';
    p1.MarkerSize = 20;
    xlabel('geological times')
    ylabel('pseudospecies')
    % ylim([1 6000]);
    ylim([0 5700]);
    yyaxis right;
    p3 = plot(x2, y4);
    p3.LineWidth = 1.5;
    title('Baltica');
    set(gca,'FontSize',8);

end

%% save
exportgraphics(gcf,'Regicurves_Song.tif','Resolution',300)
