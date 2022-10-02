function p1=plot_shade(x_vect,data_min,data_moy,data_max,alpha_val,color,linewidth)
%
% x_vect = vector corresponding to the abscissa 
% data_min = vector with the min values delimiting the the shaded area
% data_moy = vector with the average values within the the shaded area
% data_max = vector with the max values delimiting the the shaded area
% alpha_val = transparency of the shaded area
% color = color for the shaded area and the data
% linewidth = linewidth of data_moy
%
% Loïck Kléparski Avril 2022

plot(x_vect,data_min,'Color','none','HandleVisibility','off')
hold on
plot(x_vect,data_max,'Color','none','HandleVisibility','off')

patch([x_vect' fliplr(x_vect')],[data_min' fliplr(data_max')],color,...
    'FaceAlpha',alpha_val,'EdgeColor','none','HandleVisibility','off')

p1=plot(x_vect,data_moy,'-','LineWidth',linewidth,'Color',color);
