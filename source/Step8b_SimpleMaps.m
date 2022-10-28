figure('Units', 'centimeters', 'Position', [1,1,20,20], 'PaperType', 'a4');
t=tiledlayout(3, 3, 'TileSpacing', 'compact');

for i=1:nb
    hold on
    clear c a ag1 ag2 h
    c = [Song(i).MATDEF];
 
    ax = nexttile;

    h = imagesc(c)
    set(h, 'Alphadata', ~isnan(c))
    colormap('jet')
    colorbar
    yticks([1 45 90 135 179])
    yticklabels({'90N', '45N', '0', '45S', '90S'})
    xticks([81 161 241 321])
    xticklabels({'180W', '90W', '0°', '90E'})
    caxis([0 6500])
end
    