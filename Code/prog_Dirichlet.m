function K = prog_Dirichlet()
% ====prog_Dirichlet - Résolution numérique de l'équation -u'' + alpha*u = f avec des CL
% Dirichlet non homogènes========================= 
%   alpha: Paramètre dans l'équation
%   aa, bb: Bornes de l'intervalle spatial
%   n: Nombre d'intervalles pour le maillage
%   h: Pas de maillage
%   xm: Points du maillage
%   M, K: Matrices pour les termes associés à la solution u
%   F: Vecteur pour les termes associés à la fonction f
%   il, jl, ig, jg: Indices locaux et globaux pour les boucles

alpha = 1;
aa = 0;
bb = 1;
u0 = 1;
u1 = -1;

if aa >= bb 
    error('aa doit être inférieur à bb');
end

n = 3;
h = (bb - aa) / n; % Nombre d'intervalles et pas uniforme de chaque intervalle
xm = aa:h:bb; % Points du maillage : xm(1)=aa, xm(2)=aa+h, ..., xm(n+1)=bb
M = sparse(n+1, n+1); % Initialisation de la matrice M
K = M; % Initialisation de la matrice K
F = sparse(n+1, 1); % Initialisation du vecteur F

% Calcul des termes associés à la fonction f sur chaque intervalle
for k = 1:n
    for il = 1:2 
        ig = k - 1 + il;
        F(ig) = F(ig) + Simpson(@phibasef, xm(k), xm(k+1), xm(k), xm(k+1), il);
    end
end

% Calcul des termes associés à la solution u et à ses dérivées sur chaque intervalle
for k = 1:n 
    for il = 1:2 
        ig = k - 1 + il;
        for jl = 1:2 
            jg = k - 1 + jl;
            
            M(ig, jg) = M(ig, jg) + Simpson(@Prod_phi_phj, xm(k), xm(k+1), xm(k), xm(k+1), il, jl);
            K(ig, jg) = K(ig, jg) + Simpson(@Prod_der_phi_phj, xm(k), xm(k+1), xm(k), xm(k+1), il, jl);
        end
    end
end

% Matrice du membre de gauche
K = K + alpha * M;

%=========== CL de Dirichlet=========
K(n+1, n+1) = 1e7;
K(1, 1) = 1e7;
F(1) = u0 * K(1, 1);
F(n+1) = u1 * K(n+1, n+1);

% Résolution du système linéaire
u = K \ F;

% Affichage de la solution
figure;
plot(xm, u, 'b');
hold on;

%====dessin pour la solution exacte pour le cas de Dirichlet========
x = linspace(aa, bb, 100);
alpha_exacte = -2 / (exp(1) - exp(-1));
beta_exacte = 2 / (exp(1) - exp(-1));
y_exacte = alpha_exacte * exp(x) + beta_exacte * exp(-x) + 1;
plot(x, y_exacte, 'r');

%=============dessin=============
xlabel('x');
ylabel('u');
title('u en fonction de x');
legend('Solution numérique', 'Solution exacte');
grid on;
hold off;
end
