%% Step8_Maps
%we create the maps that contain the biodiversity

figure('Units', 'centimeters', 'Position', [1,1,55,30], 'PaperType', 'a4');
t=tiledlayout(3, 3, 'TileSpacing', 'compact');

for i=1:nb
    hold on
    clear c Conti text a ag1 ag2
    c = [Song(i).MATDEF];
    Conti = [Mask(i).conti];
    Conti(Conti == 1) = 10000000;
    time = [Song(i).geotimes];
    PAL = [Song(i).PAL];
    bb =Mask(i).bathi;
    bb(isnan(bb) == 1) = 0;
    bb = double(bb);
    dd = Mask(i).conti;
    dd(isnan(dd) == 1) = 0;
    dd = double(dd);
    
    ax = nexttile;
    
    ag1 = worldmap('world');
    pcolorm(latdef, [longdef longdef(1)], [c c(:,1)])
    pcolorm(latdef, [longdef longdef(1)], [Conti Conti(:,1)])
    b1 = contourm(latdef,[longdef longdef(:,1)],[bb, bb(:,1)], 'k');
    d1 = contourm(latdef, longdef, dd, 'k');
    
    setm(ag1, 'meridianlabel', 'off', 'parallellabel', 'off', 'plabellocation', 45);
    setm(ag1,'glinestyle','-','glinewidth',0.75,'gcolor',[0.75 0.75 0.75],'FontName','Arial','FontSize',12);
    set(gcf,'Color',[1,1,1]);
    setm(gca,'Origin',[0 -90 0], 'PLabelMeridian',-270);
    caxis([0 7000]);
    xlabel('Longitude');
    ylabel('Latitude');
    ag2 = colorbar;
    set(ag2,'FontName','Arial','FontSize',12);
    z=parula;
    z(end,:)=[0.7 0.7 0.7];
    colormap(z);
    title([num2str(time) ' Ma ' num2str(PAL) ' PAL']);
    hold off;
end

%% save
exportgraphics(gcf,'GlobalMaps_Song.tif','Resolution',300)
