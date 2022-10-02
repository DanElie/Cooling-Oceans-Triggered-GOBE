% FONCTION QUI CALCULE ET TESTE LE COEFFICIENT DE CORRELATION DE BRAVAIS-PEARSON POUR DEUX VECTEURS COLONNES
% Donn�es manquantes accept�es
%
% INPUTS:
% x: vecteur colonne x
% y: vecteur colonne y
%
% OUTPUTS:
% r: coefficient de correlation de BRAVAIS-PEARSON
% ddl: degr� de libert� corrig� ou pas
% test Fc: r�sultats du test Fc 
% probaA: probabilit� 
%
%
% Voir PEARSON pour correction autocorrelation
%
% Gr�gory BEAUGRAND FEBRUARY 2001

function [r,Fc,proba,nbcoupl]=pearsonm(x,y)
f=find(isnan(x)==0 & isnan(y)==0);				% d�tection des couples pr�sents
nbcoupl=length(f);									% nombre de donn�es pr�sentes
rt=corrcoef(x(f,1),y(f,1));						% calcule de la matrice de corr�lation
r=rt(2,1);												% coefficient de corr�lation
%--------------------------------------------------------------------------------------------------
Fc=((nbcoupl-2)*r.^2)/(1-r.^2);		% test FCS sans correction
proba=1-fcdf(Fc,1,nbcoupl-2);			% probabilit� alpha
