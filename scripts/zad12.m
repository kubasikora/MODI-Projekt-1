% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt porównowuj¹cy wzmocnienia statyczne transmitancji oraz modelów w
% przestrzeni stanów

clear;
set_params;
u_lin = 0.5;

% Symulacja
sim('zad12_test')

% Wykres b³êdny
fig = figure('Name', strcat('Porównanie transmitancji i modelu w przestrzeni stanów 1, u = ', num2str(u_lin)));
set(gcf, 'Position', [100, 100, 800, 600])
hold on;
grid on;
grid minor;
plot(nonlin_out_G);
plot(nonlin_out_C);
legend('Transmitancja', 'Model w przestrzeni stanów (z sta³ymi)', 'Location', 'southwest');
title(strcat('Porównanie transmitancji i modelu w przestrzeni stanów 1, u = ', num2str(u_lin)), 'FontName', 'Helvetica');
xlabel('Wartoœæ sterowania u');
ylabel('Wyjœcie modelu y');
name = 'figures\zad12\porownanie7';
print_figure(name, 'figures\zad12')


% Wykres poprawny
fig = figure('Name', strcat('Porównanie transmitancji i modelu w przestrzeni stanów 2, u = ', num2str(u_lin)));
set(gcf, 'Position', [100, 100, 800, 600])
hold on;
grid on;
grid minor;
plot(nonlin_out_G);
plot(nonlin_out_M);
legend('Transmitancja', 'Model w przestrzeni stanów (bez sta³ych)', 'Location', 'southwest');
title(strcat('Porównanie transmitancji i modelu w przestrzeni stanów 2, u = ', num2str(u_lin)), 'FontName', 'Helvetica');
xlabel('Wartoœæ sterowania u');
ylabel('Wyjœcie modelu y');

% Zapis wykresu do pliku
name = 'figures\zad12\porownanie8';
print_figure(name, 'figures\zad12')


% Wykres testowy
fig = figure('Name', strcat('Porównanie transmitancji i modelu w przestrzeni stanów 3, u_ = ', num2str(u_lin)));
set(gcf, 'Position', [100, 100, 800, 600])
hold on;
grid on;
grid minor;
plot(nonlin_out_G2);
plot(nonlin_out_C);
legend('Zmodyfikowana transmitancja', 'Model w przestrzeni stanów (z sta³ymi)', 'Location', 'southwest');
title(strcat('Porównanie transmitancji i modelu w przestrzeni stanów 3, u = ', num2str(u_lin)), 'FontName', 'Helvetica');
xlabel('Wartoœæ sterowania u');
ylabel('Wyjœcie modelu y');


% Zapis wykresu do pliku
name = 'figures\zad12\porownanie9';
print_figure(name, 'figures\zad12')