% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt por�wnowuj�cy wzmocnienia statyczne transmitancji oraz model�w w
% przestrzeni stan�w

clear;
set_params;
u_lin = 1;

% Symulacja
sim('zad12_test')

% Wykres b��dny
fig = figure('Name', 'Por�wnanie transmitancji i modelu w przestrzeni stan�w 1');
set(gcf, 'Position', [100, 100, 800, 600])
hold on;
grid on;
grid minor;
plot(nonlin_out_G);
plot(nonlin_out_C);
legend('Transmitancja', 'Model w przestrzeni stan�w (z sta�ymi)', 'Location', 'northeast');
title('Por�wnanie transmitancji i modelu w przestrzeni stan�w 1', 'FontName', 'Helvetica');
xlabel('Warto�� sterowania u');
ylabel('Wyj�cie modelu y');


name = 'figures\zad12\porownanie1';
print_figure(name, 'figures\zad12')

% Wykres poprawny
fig = figure('Name', 'Por�wnanie transmitancji i modelu w przestrzeni stan�w 2');
set(gcf, 'Position', [100, 100, 800, 600])
hold on;
grid on;
grid minor;
plot(nonlin_out_G);
plot(nonlin_out_M);
legend('Transmitancja', 'Model w przestrzeni stan�w (bez sta�ych)', 'Location', 'northeast');
title('Por�wnanie transmitancji i modelu w przestrzeni stan�w 2', 'FontName', 'Helvetica');
xlabel('Warto�� sterowania u');
ylabel('Wyj�cie modelu y');

% Zapis wykresu do pliku
name = 'figures\zad12\porownanie2';
print_figure(name, 'figures\zad12')