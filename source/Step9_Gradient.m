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

%% Gradient as median of MATDEF

for i = 1:7
    clear GL
    GL = Song(i).MATDEF;
    GL = nanmedian(GL, 2);
    LBG(:,i) = GL;
end

%figure;
%hold on;
%contourf([Song.geotimes], latdef, LBG,[0 100:500:6500]);
%caxis([0 7000]);
%colormap('jet');
%h = colorbar;
%h.Label.String = 'Pseudospecies richness';
%xlabel('Geological time');
%ylabel('latitude');
%title('LBG (mediane)')

%% Plot
ff(62:65, 1) = nan;

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
ff(62:65, 1) = 0;

figure;
hold on;
h = imagesc([Song.geotimes], latdef, ff);
set(h, 'Alphadata', ~isnan(ff));
% h = pcolor([Song.geotimes], latdef, ff);
[C, hh] = contour([Song.geotimes], latdef, ff);
% [M, hh]
% set(h, 'EdgeColor', 'none');
caxis([0 7000]);
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
