function K = prog_Neumann()
%=========== Résolution numérique de l'équation -u'' + alpha*u = f avec des CL
% de Neumann non homogènes =========================================== 
%   alpha: Paramètre dans l'équation
%   aa, bb: Bornes de l'intervalle spatial
%   n: Nombre d'intervalles pour le maillage
%   h: Pas de maillage
%   xm: Points du maillage
%   M, K: Matrices pour les termes associés à la solution u
%   F: Vecteur pour les termes associés à la fonction f
%   il, jl, ig, jg: Indices locaux et globaux pour les boucles

% Initialiser les paramètres 
alpha = 1;
aa = 0;
bb = 1;
u0 = 1;
u1 = -1;

%========= Test de l'intervalle ===========
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

%========= Cas Neumann non Homogène ===========
F(n+1) = F(n+1) + u1;
F(1) = F(1) - u0;
u = K\F;

% Graphe de la solution u(x)
figure;
plot(xm, u, 'b'); 
hold on;

% ================= Dessin pour la solution exacte pour le cas de Neumann =========
x = linspace(aa, bb, 100);
alpha=(1+exp(1))/(exp(-1)-exp(1));
beta=(exp(-1)+1)/(exp(-1)-exp(1));
y_exacte=alpha*exp(-x)+beta*exp(x)+1;
plot(x, y_exacte, 'r');

%================ Dessin ============
xlabel('x');
ylabel('u');
title('u en fonction de x');
legend('Solution numérique', 'Solution exacte');
grid on;
end
