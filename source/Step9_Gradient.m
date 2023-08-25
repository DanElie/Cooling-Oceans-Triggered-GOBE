%% Step9 The LDG
%We produce a latitudinal gradient

ff = [Song.GL];
ff(ff == 0) = nan;

%% Gradient as median of MATDEF

for i = 1:7
    clear GL
    GL = Song(i).MATDEF;
    GL = nanmedian(GL, 2);
    LBG(:,i) = GL;
end

%% Plot

figure;
hold on

gl90 = plot(LBG(:,1), latdef);
gl60 = plot(LBG(:,4), latdef);
gl30 = plot(LBG(:,7), latdef);
gl90.LineWidth = 1.5;
gl90.Color = 'k';
gl60.LineWidth = 1.5;
gl60.Color = [0.5 0.5 0.5];
gl30.LineWidth = 1.5;
gl30.Color = [0.8 0.8 0.8];

%% Gradient Final

figure;
hold on;
h = imagesc([Song.geotimes], latdef, LBG);
set(h, 'Alphadata', ~isnan(LBG));
% h = pcolor([Song.geotimes], latdef, ff);
[C, hh] = contour([Song.geotimes], latdef, LBG);
% [M, hh]
% set(h, 'EdgeColor', 'none');
caxis([0 5500]);
colormap('parula');
h = colorbar;
h.LineWidth = 1;
w = hh.LineWidth;
hh.LineWidth = 0.7;
hh.EdgeColor = 'k'
h.Label.String = 'Pseudospecies richness';
xlabel('Geological time');
ylabel('latitude');
% title('Song Ordovician LDG');

%% save
exportgraphics(gcf,'Gradient_Song.pdf','Resolution',300)
