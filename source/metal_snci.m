function [infrequentter,temp1, temp3]=metal_snci(niche,x)
% Gregory Beaugrand Janvier 2018
%Simplified 08/22

[n,p]=size(x);

temp1=zeros(n,p);
f=find(x>=niche(1,1) & x<=niche(1,2));
temp1(f)=1;
infrequentter=length(f);

temp3=sum(temp1,2);
clear f;f=find(temp3>0);temp3(f)=1;
