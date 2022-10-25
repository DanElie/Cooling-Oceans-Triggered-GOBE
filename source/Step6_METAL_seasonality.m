%% Step 7 METAL
%Adapted from G Beaugrand 2018
%number of simulations
%threshold (i.e. number of niches we take)

seuil=floor(length(niche)/10);

%preallocation
[n,p]=size(Song(1).CS_integ);
MATDEF=nan(n,p,nbsimul);
infrequentter = zeros(seuil, nbsimul);
biotope = zeros(n,p,seuil);

%Definition d'une autre array biodiv pour les résultats
for i = 1:nb
    Song(i).infrequentter = zeros(seuil, nbsimul);
    Song(i).totalmatrices = nan(n,p,nbsimul);
    Song(i).MATDEF = nan(n,p); 
    Song(i).biotope = zeros(n,p,seuil);
    clear i;
end

clear temp
%% Boucle de colonisation
for k = 1:nb
      %%
      %definition matrice sur laquelle on fait tourner METAL
      clear TEMP   
      TEMP = [Song(k).seasonality];
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
        [infrequentter(j,i),temp1, temp2, temp3]=metal_snci_season(g,TEMP)
        temp=temp+temp2;
        GL=GL+temp3;
        biotope(:,:,j) = temp2;
    end
        %%
        MATDEF(:,:,i)=temp;
        infrequentter(infrequentter ~= 0) = 1;
        Song(k).infrequentter = infrequentter;
    end
        Song(k).total_matrices = MATDEF;
        Song(k).MATDEF = mean(MATDEF,3);
        Song(k).GL = GL;
        Song(k).biotope = biotope;
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

%% Save
save('Output_Song', 'Song', 'Mask')
