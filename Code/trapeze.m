
function val = trapeze(fun, a, b, varargin)
% trapeze - Intégration de fonction fun par la méthode des trapèzes sur [a, b].
%  INPUT :
%       fun: fonction à intégrer
%       a, b: bornes d'intégration
%       varargin: paramètres optionnels pour la fonction fun
%OUTPUT:
%      val: valeur de l'intégrale approximative

y = feval(fun, [a b], varargin{:});
fa = y(1); 
fb = y(2); 
val = (b - a) * (fa + fb) / 2;
end
