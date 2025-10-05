
function y = phibasef(x, a, b, il)
% phibasef - Calculer le produit de phi_{il}(x) * f(x) sur l'intervalle k.
%INPUT:
%   x: Variable d'intégration
%   a, b: Bornes d'intégration de l'intervalle k
%   il: Indice local pour la fonction de base phi_{il}
%OUTPUT :
%       y=la fonction de membre droite 
   
    phi_il = phibase(x, a, b, il);
    f_x = fb(x);
    y = phi_il .* f_x;
end
