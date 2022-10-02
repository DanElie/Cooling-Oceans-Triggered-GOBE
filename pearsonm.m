% FONCTION QUI CALCULE ET TESTE LE COEFFICIENT DE CORRELATION DE BRAVAIS-PEARSON POUR DEUX VECTEURS COLONNES
% Données manquantes acceptées
%
% INPUTS:
% x: vecteur colonne x
% y: vecteur colonne y
%
% OUTPUTS:
% r: coefficient de correlation de BRAVAIS-PEARSON
% ddl: degré de liberté corrigé ou pas
% test Fc: résultats du test Fc 
% probaA: probabilité 
%
%
% Voir PEARSON pour correction autocorrelation
%
% Grégory BEAUGRAND FEBRUARY 2001

function [r,Fc,proba,nbcoupl]=pearsonm(x,y)
f=find(isnan(x)==0 & isnan(y)==0);				% détection des couples présents
nbcoupl=length(f);									% nombre de données présentes
rt=corrcoef(x(f,1),y(f,1));						% calcule de la matrice de corrélation
r=rt(2,1);												% coefficient de corrélation
%--------------------------------------------------------------------------------------------------
Fc=((nbcoupl-2)*r.^2)/(1-r.^2);		% test FCS sans correction
proba=1-fcdf(Fc,1,nbcoupl-2);			% probabilité alpha
