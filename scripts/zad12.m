% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt porównowuj¹cy wzmocnienia statyczne transmitancji oraz modelów w
% przestrzeni stanów

clear;
set_params;
u_lin = 1;

% Symulacja
sim('zad12_test')

% Wykres b³êdny
fig = figure('Name', 'Porównanie transmitancji i modelu w przestrzeni stanów 1');
set(gcf, 'Position', [100, 100, 800, 600])
hold on;
grid on;
grid minor;
plot(nonlin_out_G);
plot(nonlin_out_C);
legend('Transmitancja', 'Model w przestrzeni stanów (z sta³ymi)', 'Location', 'northeast');
title('Porównanie transmitancji i modelu w przestrzeni stanów 1', 'FontName', 'Helvetica');
xlabel('Wartoœæ sterowania u');
ylabel('Wyjœcie modelu y');


name = 'figures\zad12\porownanie1';
print_figure(name, 'figures\zad12')

% Wykres poprawny
fig = figure('Name', 'Porównanie transmitancji i modelu w przestrzeni stanów 2');
set(gcf, 'Position', [100, 100, 800, 600])
hold on;
grid on;
grid minor;
plot(nonlin_out_G);
plot(nonlin_out_M);
legend('Transmitancja', 'Model w przestrzeni stanów (bez sta³ych)', 'Location', 'northeast');
title('Porównanie transmitancji i modelu w przestrzeni stanów 2', 'FontName', 'Helvetica');
xlabel('Wartoœæ sterowania u');
ylabel('Wyjœcie modelu y');

% Zapis wykresu do pliku
name = 'figures\zad12\porownanie2';
print_figure(name, 'figures\zad12')