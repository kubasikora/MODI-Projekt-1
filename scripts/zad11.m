% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt wykreœla charakterystykê wzmocnienia transmitancji od punktu
% linearyzacji

clear;
set_params;
Tp = 1;

% Wyznaczenie transmitancji
u_lin = linspace(-1,1,101);

Kstat = -(40*((81*u_lin)/400 - (189*u_lin.^2)/1600 - (27*u_lin.^3)/200 + 63/2000));

% Narysowanie wykresu
plot(u_lin, Kstat);
xlabel('Punkt linearyzacji sterowania');
ylabel('Wartoœæ wzmocnienia transmitancji');
title('Wzmocnienie transmitancji w funkcji punktu pracy');
grid on;
grid minor;

% Zapis wykresu do pliku
name = strcat('figures\zad11\K_od_u_lin');
print_figure(name, 'figures\zad11')

