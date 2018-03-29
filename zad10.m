% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt wyznaczaj¹cy transmitancjê zlinearyzowanego modelu dyskretnego w
% punkkcie pracy u_lin

clear;
syms a1 a2 a3 a4 K T1 T2 Tp pkt_pracy z G

% Parametry modelu w przestrzeni stanu
A = [(T1*T2 - (T1+T2)*Tp)/(T1*T2) Tp; -Tp/(T1*T2) 1];
B = [0; (K*Tp*(a1 + 2*a2*pkt_pracy + 3*a3*pkt_pracy^2 + 4*a4*pkt_pracy^3))/(T1*T2)];
C = [1 0];
D = 0;

% Wzór na transmitancjê
G = C*(inv(z*eye(2) - A))*B + D;

disp('Transmitancja dyskretna parametryzowana G(z):');
disp(G);

% Podstawienie parametrów modelu
set_params;
Tp = 1;
pkt_pracy = 1;
syms G z
G = (K*Tp^2*(4*a4*pkt_pracy^3 + 3*a3*pkt_pracy^2 + 2*a2*pkt_pracy + a1))/(Tp^2 - T2*Tp - T1*Tp - T1*T2*z + T1*Tp*z + T2*Tp*z + T1*T2*z^2);
disp('Postaæ z podstawionymi parametrami: ');
disp(G);

% % Model dyskretny
% model = tf((K*Tp^2*(4*a4*(pkt_pracy^3) + 3*a3*(pkt_pracy^2) + 2*a2*pkt_pracy + a1))/(T1*T2), [(T1*T2) (2*T1*T2 + T1*Tp + T2*Tp) (T1*T2 - T1*Tp - T2*Tp + Tp)], Tp);
% % wzm1
% step(model, 1000)
% %disp(resp(1000));
