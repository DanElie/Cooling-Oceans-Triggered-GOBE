%% Step 6 METAL + Allopatry
%Adapted from G Beaugrand 2018
%Allopatric Speciation D Eliahou 2022
%number of simulations
%threshold (i.e. number of niches we take)

seuil=floor(length(niche)/10);

%preallocation
[n,p]=size(Song(1).lat60);
MATDEF=nan(n,p,nbsimul);
infrequentter = zeros(seuil, nbsimul);
allopatrie = zeros(seuil, nbsimul);

%Definition d'une autre array biodiv pour les résultats
for i = 1:nb
    Song(i).infrequentter = zeros(seuil, nbsimul);
    Song(i).totalmatrices = nan(n,p,nbsimul);
    Song(i).MATDEF = nan(n,p); 
    Song(i).allopatrie = zeros(seuil, nbsimul);

    clear i;
end

clear temp
%% Boucle de colonisation
for k = 1:nb
      %%
      %definition matrice sur laquelle on fait tourner METAL
      clear TEMP   
      TEMP = [Song(k).lat60];
    for i=1:nbsimul
    disp(strcat(num2str(-1*Song(k).geotimes), " Ma : iteration ", num2str(i), "/", num2str(nbsimul), " done"));
    clear test val ind nichetemp temp
    temp=[Mask(k).lat60];
    GL=zeros(n,1);
    test=rand(length(niche),1);
    [val,ind]=sort(test);
    nichetemp=niche(ind(1:seuil),:);
    Song(k).niche = nichetemp;
             
      %%
    parfor j=1:length(nichetemp)
        g=nichetemp(j,:);
%         [infrequentter(j,i),temp1, temp3]=metal_snci(g,TEMP)
        [infrequentter(j,i),temp1,temp2,temp3,allopatrie(j,i)] = metal_snci_allopatry(g,TEMP);
        temp=temp+temp2;
        GL=GL+temp3;
    end
        %%
        MATDEF(:,:,i)=temp;
        infrequentter(infrequentter ~= 0) = 1;
        Song(k).infrequentter = infrequentter;
        Song(k).allopatrie = allopatrie;

    end
        Song(k).total_matrices = MATDEF;
        Song(k).MATDEF = mean(MATDEF,3);
        Song(k).GL = GL;
end

%Get the mediane and the sd
clear ee;

for i = 1:nb
    ee = Song(i).MATDEF;
    ee = ee(:);
    ee(isnan(ee)) = [];
    Song(i).mediane = median(ee);
    Song(i).sd = std(ee);
    clear ee
end

for i=1:nb
    clear a
    a = Song(i).allopatrie;
    a(isnan(a) == 1) = 0;
    a = sum(a);
    Song(i).nb_allop = mean(a);
    Song(i).sd_allop = std(a);
    clear a
end

%% Save
% save('Output_Song', 'Song', 'Mask')

