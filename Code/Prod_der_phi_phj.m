
function y = Prod_der_phi_phj(x, a, b, il, jl)
    %  Prod_der_phi_phj - Calculer le produit des dérivées des fonctions de base phi_{il}' * phi_{jl}'.
    %INPUT:
    %    x: Variable d'intégration
    %   a, b: Bornes d'intégration de l'intervalle k
    %   il, jl: Indices locaux pour les fonctions de base
    %OUTPUT: 
    %   y: le produit de phi_i' *phi_j'
    Derive_phi_il = Derive_phibase(x, a, b, il);
    Derive_phi_jl = Derive_phibase(x, a, b, jl);
    y = Derive_phi_il .* Derive_phi_jl;
end

