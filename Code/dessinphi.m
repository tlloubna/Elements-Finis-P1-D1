% Définir les valeurs de x, a, b et i
x = linspace(0, 1, 100); % Vecteur de 100 points entre 0 et 1
a = 0;
b = 1;
i = 2;

% Appeler la fonction phibase pour calculer phi
phi_values = phibase(x, a,b,i);

% Afficher le résultat
figure;
plot(x, phi_values);
xlabel('x');
ylabel('\phi(x)');
title(['\phi(x) en fonction de x pour i = ' num2str(i)]);
grid on;
