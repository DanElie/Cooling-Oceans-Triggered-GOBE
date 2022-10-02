function [infrequentter,temp1,temp2,temp3,nbspecies1]=metal_snci_allopatry(niche,x)

% Gregory Beaugrand Janvier 2018

[n,p,z]=size(x);

temp1=zeros(n,p,z);
temp2=zeros(n,p);
f=find(x>=niche(1,1) & x<=niche(1,2));
temp1(f)=1;
temp2=squeeze(sum(temp1,3));
clear f;f=find(temp2>0);temp2(f)=1;
infrequentter=length(f);
temp3=sum(temp2,2);
clear f;f=find(temp3>0);temp3(f)=1;

%% Fonctions speciation
latdef=[89:-1:-89];
longdef = [-178:1:178];
seuil = 0.5;
[nbspecies1] = fonctionPACMAN(temp2, latdef, longdef, 0.5);
