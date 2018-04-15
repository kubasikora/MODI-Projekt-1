% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt wykre�la charakterystyk� wzmocnienia transmitancji od punktu
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
ylabel('Warto�� wzmocnienia transmitancji');
title('Wzmocnienie transmitancji w funkcji punktu pracy');
grid on;
grid minor;

% Stw�rz folder na wykresy je�li jeszcze nie istnieje
if(exist('figures', 'dir') == 0)
    mkdir('figures');
end

if(exist('figures\zad11', 'dir') == 0)
    mkdir('figures\zad11');
end

% Zapis wykresu do pliku
name = strcat('figures\zad11\K_od_u_lin');
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 80 60]);
set(gcf,'PaperPositionMode','auto');
print(name,'-dpdf','-r400');