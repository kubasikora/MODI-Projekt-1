% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt rysuj¹cy wykres charakterystyki statycznej do zadania 4

clear;
set_params;

u = linspace(-1,1,100);
y = K*(a1*u + a2*(u.^2) + a3*(u.^3) + a4*(u.^4));

% Rysowanie wykresu
fig = figure('Name', 'Charakterystyka statyczna procesu'); 
set(gcf, 'Position', [100, 100, 800, 600])
hold on;
grid on;
grid minor;
plot(u,y);
legend('Charakerystyka statyczna', 'Location', 'northeast');
title('Charakterystyka statyczna procesu', 'FontName', 'Helvetica');
xlabel('Wartoœæ sterowania u');
ylabel('Wyjœcie modelu y');

name = strcat('figures\zad4\char_statyczna');
print_figure(name, 'figures\zad4')