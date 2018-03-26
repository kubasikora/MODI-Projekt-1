% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt wyznaczaj¹cy transmitancjê zlinearyzowanego modelu dyskretnego w
% punkkcie pracy u_lin

clear;
syms a1 a2 a3 a4 K T1 T2 Tp u z G

% Parametry modelu w przestrzeni stanu
A = [(-(T1+T2)*Tp)/(T1*T2) Tp; -Tp/(T1*T2) 1];
B = [0; (K*Tp)*(a1 + 2*a2*u + 3*a3*(u^2) + 4*a4*(u^3))/(T1*T2)];
C = [1 0];
D = 0;

% Wzór na transmitancjê
G = C*((z*eye(2) - A)^-1)*B + D;

disp('Transmitancja dyskretna parametryzowana G(z):');
disp(G);

% Podstawienie parametrów modelu
set_params;
Tp = 1;
u = 0;
syms G z
G = (K*Tp^2*(4*a4*u^3 + 3*a3*u^2 + 2*a2*u + a1))/(Tp^2 - T2*Tp - T1*Tp - T1*T2*z + T1*Tp*z + T2*Tp*z + T1*T2*z^2);
disp(['Transmitancja dyskretna dla Tp = ', num2str(Tp), ' oraz u = ', num2str(u), ':']);
disp(G);