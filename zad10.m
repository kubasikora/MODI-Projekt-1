% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt wyznaczaj¹cy transmitancjê zlinearyzowanego modelu dyskretnego w
% punkkcie pracy u_lin

% Parametry modelu w przestrzeni stanu ci¹g³e
% A = [(T1*T2 - (T1+T2)*Tp)/(T1*T2) Tp; -Tp/(T1*T2) 1];
% B = [0; (K*Tp*(a1 + 2*a2*pkt_pracy + 3*a3*pkt_pracy^2 + 4*a4*pkt_pracy^3))/(T1*T2)];
% C = [1 0];
% D = 0;

A = [(-T1 - T2)/(T1*T2) 1; -1/(T1*T2) 0];
B = [0; a1 + 2*a2*u_lin + 3*a3*(u_lin^2) + 4*a4*(u_lin^3)];
C = [1 0];
D = 0;

sys = ss(A,B,C,D,Tp)

step(sys)


t = tf(sys)


