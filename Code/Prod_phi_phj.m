function y = Prod_phi_phj(x, a, b, il, jl)
    % Prod_phi_phj- Calculer le produit de phi pour l'intégrale de la matrice M.
    % INPUT
    %   x: Variable d'intégration
    %   a, b: Bornes d'intégration
    %   il, jl: Indices locaux
    %OUTPUT:
    %   y : le produit de phi_j et phi_i
    phi_il = phibase(x, a, b, il);
    phi_jl = phibase(x, a, b, jl);
    y = phi_il .* phi_jl;
end
