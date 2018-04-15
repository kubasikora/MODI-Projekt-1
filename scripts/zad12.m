% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt porównowuj¹cy wzmocnienia statyczne transmitancji oraz modelów w
% przestrzeni stanów

clear;
set_params;
u_lin = 1;

%Stwórz folder na wykresy jeœli jeszcze nie istnieje
if(exist('figures', 'dir') == 0)
    mkdir('figures');
end

if(exist('figures\zad12', 'dir') == 0)
    mkdir('figures\zad12');
end

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

% Zapis wykresu do pliku
name = 'figures\zad12\porownanie1';
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 80 60]); %x_width=10cm y_width=15cm
set(gcf,'PaperPositionMode','auto');
print(name,'-dpng','-r0');
hold off;

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
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 80 60]); %x_width=10cm y_width=15cm
set(gcf,'PaperPositionMode','auto');
print(name,'-dpdf','-r400');
hold off;