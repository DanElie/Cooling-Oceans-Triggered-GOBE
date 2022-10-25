function [infrequentter,temp1,temp2,temp3]=metal_snci_season(niche,x)
% Gregory Beaugrand Janvier 2018

[n,p,z]=size(x);

temp1=zeros(n,p,z);
temp2=zeros(n,p);
f=find(x>=niche(1,1) & x<=niche(1,2));
temp1(f)=1;
temp2=squeeze(sum(temp1,3));
temp2(temp2 < 10) = 0;
temp2(temp2 ~= 0) = 1;
infrequentter=length(f);
temp3=sum(temp2,2);
clear f;f=find(temp3>0);temp3(f)=1;




