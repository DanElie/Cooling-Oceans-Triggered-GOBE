%Equivalent Fonction speciesMETAL

% x: matrice latitudes x longitudes avec les probabilites d'occurrence des especes 
% lat: vecteur latitudes
% lon: vecteur longitudes (ce vecteur doit avoir une longueur ayant un
% nombre impair. 
% seuil: seuil de probabilite ou on considere que les especes sont
% presentes (seuil=0.2) ou ici 0.5
%   La fonction matlab bwlabel permet de séparer les masses continentales
%   mais il faut d'abord "refermer" la matrice

function [nbspecies] = fonctionPACMAN(x, latdef, longdef, seuil)
%on peut rajouter species de forme [species, nbspecies]

l = length(latdef);

f=find(x<=seuil);
x(f)=nan;
clear f
f=find(isnan(x)==0);
test=f;

%% bwlabel

clear f
f=find(isnan(x)==1);
x(f)=0;

pacman=bwlabel(x);
pacman(pacman==0)=nan;

%% Ferme les continents

for i= 1:l
    temp = pacman(i,:);
          if isnan(pacman(i,1)) ==  1 && isnan(pacman(i,end)) ==1
        continue
          elseif isnan(temp(1)) == 0 && isnan(temp(end)) == 0
        clear f; f = find(pacman == pacman(i,end));
        pacman(f) = pacman(i,1);
        
            elseif  isnan(pacman(i-1, 1)) == 0 && isnan(pacman(i, end)) == 0
        clear f; f = find(pacman == pacman(i,end));
        pacman(f) = pacman(i-1,1);
%     elseif  isnan(pacman(i+1, 1)) == 0 && isnan(pacman(i, end)) == 0
%         clear f; f = find(pacman == pacman(i,end));
%         pacman(f) = pacman(i+1, 1);
    end
end

[n,p]=size(x);
species = pacman;
clear pacman
species2=reshape(species,n*p,1);
nbspecies=nanmax(species2);

%% Speciation
% 
% [n,p]=size(x);  
% species = pacman;
% clear pacman
% species2=reshape(species,n*p,1);
% nbspecies=nanmax(species2);
% 
% for i=1:length(lat)
%     clear test
%     test=abs(species(i,1)-species(i,end));
%     if test>0
%         clear f;f=find(species==species(i,end));
%         species(f)=species(i,1);
%     end
% end

%% Pixels suffisants a prendre en compte

cp=0;
for i=1:nbspecies
    clear f
    f=find(species==i);
    if length(f)==1
        species(f)=nan;
    elseif length(f)>1
        cp=cp+1;
        species(f)=cp;
    end
end
species2=reshape(species,n*p,1);
nbspecies=nanmax(species2);

