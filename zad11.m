% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt wykreœla charakterystykê wzmocnienia transmitancji od punktu
% linearyzacji

set_params;
Tp = 1;

% Wyznaczenie transmitancji
u = linspace(-1,1,101);
Kdyn = (K*(Tp^2)*(4*a4*(u.^3) + 3*a3*(u.^2) + 2*a2*u + a1))/(T1*T2);
Kstat = (K*Tp^2*(4*a4*u.^3 + 3*a3*u.^2 + 2*a2*u + a1))/(Tp^2 - T2*Tp - T1*Tp - T1*T2 + T1*Tp + T2*Tp + T1*T2);
KG = (K*Tp^2*(4*a4*u.^3 + 3*a3*u.^2 + 2*a2*u + a1))/(Tp^2 - T2*Tp - T1*Tp);

% Narysowanie wykresu
plot(u, Kstat);
xlabel('Punkt linearyzacji sterowania');
ylabel('Wartoœæ wzmocnienia transmitancji');
title('Wzmocnienie transmitancji w funkcji punktu pracy');
grid on;
grid minor;

% Stwórz folder na wykresy jeœli jeszcze nie istnieje
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
print(name,'-dpng','-r0');