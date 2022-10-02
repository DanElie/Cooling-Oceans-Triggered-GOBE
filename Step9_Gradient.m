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
colormap('jet');
h = colorbar;
h.Label.String = 'Pseudospecies richness';
xlabel('Geological time');
ylabel('latitude');
%title('Song Ordovician LDG');

%% save

saveas(gcf,'Gradient_Song.pdf')