

function phi = phibase(x, a, b, i)
    % i = 1 ou 2
    if ~(i == 1 || i == 2)
        error('Il faut que i soit égal à 1 ou 2.');
    end

    % Vérifier que tous les éléments de x sont dans l'intervalle [a, b]
    if any(x < a) || any(x > b)
        error('Tous les éléments de x doivent être dans l''intervalle [a, b].');
    end

    % Calculer phi pour chaque élément de x
    if i == 1
        phi = (x - b) / (a - b);
    elseif i == 2
        phi = (x - a) / (b - a);
    end
end
