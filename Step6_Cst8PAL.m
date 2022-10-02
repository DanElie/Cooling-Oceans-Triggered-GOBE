%% Step 6b METAL for Cst8PAL
%Adapted from G Beaugrand 2018
%number of simulations
%threshold (i.e. number of niches we take)

seuil=floor(length(niche)/10);

%preallocation
[n,p]=size(Cst8PAL(1).lat60);
MATDEF=nan(n,p,nbsimul);
infrequentter = zeros(seuil, nbsimul);

%Definition d'une autre array biodiv pour les résultats
for i = 1:nb
    Cst8PAL(i).infrequentter = zeros(seuil, nbsimul);
    Cst8PAL(i).totalmatrices = nan(n,p,nbsimul);
    Cst8PAL(i).MATDEF = nan(n,p); 
    clear i;
end

clear temp
%% Boucle de colonisation
for k = 1:nb
      %%
      %definition matrice sur laquelle on fait tourner METAL
      clear TEMP   
      TEMP = [Cst8PAL(k).lat60];
    for i=1:nbsimul
    disp(strcat(num2str(-1*Cst8PAL(k).geotimes), " Ma : iteration ", num2str(i), "/", num2str(nbsimul), " done"));
    clear test val ind nichetemp temp
    temp=[Mask(k).lat60];
    GL=zeros(n,1);
    test=rand(length(niche),1);
    [val,ind]=sort(test);
    nichetemp=niche(ind(1:seuil),:);
    Cst8PAL(k).niche = nichetemp;
             
      %%
    parfor j=1:length(nichetemp)
        g=nichetemp(j,:);
        [infrequentter(j,i),temp1, temp3]=metal_snci(g,TEMP)
        temp=temp+temp1;
        GL=GL+temp3;
    end
        %%
        MATDEF(:,:,i)=temp;
        infrequentter(infrequentter ~= 0) = 1;
        Cst8PAL(k).infrequentter = infrequentter;

    end
        Cst8PAL(k).total_matrices = MATDEF;
        Cst8PAL(k).MATDEF = mean(MATDEF,3);
        Cst8PAL(k).GL = GL;
end

%Get the mediane and the sd
clear ee;

for i = 1:nb
    ee = Cst8PAL(i).MATDEF;
    ee = ee(:);
    ee(isnan(ee)) = [];
    Cst8PAL(i).mediane = median(ee);
    Cst8PAL(i).sd = std(ee);
    clear ee
end

%% Save
save('Output_Cst8PAL', 'Cst8PAL', 'Mask')

