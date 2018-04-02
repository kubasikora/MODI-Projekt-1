% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt wyznaczaj¹cy transmitancjê zlinearyzowanego modelu dyskretnego w
% punkkcie pracy u_lin

clear;
set_params;
Tp = 1;
u_lin = 1;

syms s u_lin 

A = [-(T1+T2)/(T1*T2) 1; -1/(T1*T2) 0];
B = [0; (K*(a1 + 2*a2*u_lin + 3*a3*(u_lin^2) + 4*a4*(u_lin^3)))/(T1*T2)];
C = [1 0];
D = 0;

G = C*((s*eye(2) - A)^-1)*B;

disp('Transmitancja uzyskana z ci¹g³ego modelu dynamicznego zlinearyzowanego (pkt. lin u = 1): ');
disp(G);