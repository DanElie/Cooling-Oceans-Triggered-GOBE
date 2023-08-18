%% Step9 The LDG
%We produce a latitudinal gradient

ff = [Song.GL];

ff(1:54, 1) = nan;
ff(1:52, 2) = nan;
ff(1:54, 3) = nan;
ff(1:54, 4) = nan;
ff(1:49, 5) = nan;
ff(1:48, 6) = nan;
ff(1:44, 7) = nan;
ff(151:end,:) = nan;

figure;
hold on;
contourf([Song.geotimes], latdef, ff);
caxis([0 7000]);
colormap('parula');
h = colorbar;
h.Label.String = 'Pseudospecies richness';
xlabel('Geological time');
ylabel('latitude');
%title('Song Ordovician LDG');

%% Gradient as median of MATDEF

for i = 1:7
    clear GL
    GL = Song(i).MATDEF;
    GL = nanmedian(GL, 2);
    LBG(:,i) = GL;
end

figure;
hold on;
contourf([Song.geotimes], latdef, LBG,[0 100:500:6500]);
caxis([0 7000]);
colormap('jet');
h = colorbar;
h.Label.String = 'Pseudospecies richness';
xlabel('Geological time');
ylabel('latitude');
title('LBG (mediane)')

%% save
exportgraphics(gcf,'Gradient_Song.tif','Resolution',300)
