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

% Stwórz folder na wykresy jeœli jeszcze nie istnieje
if(exist('figures', 'dir') == 0)
    mkdir('figures');
end
if(exist('figures\zad4', 'dir') == 0)
    mkdir('figures\zad4'); 
end

% Zapis wykresu do pliku
name = strcat('figures\zad4\char_statyczna');
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 80 60]); %x_width=10cm y_width=15cm
set(gcf,'PaperPositionMode','auto');
print(name,'-dpdf','-r400');
hold off;
