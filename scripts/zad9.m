% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt rysuj�cy charakterystyki dynamiczne zlinearyzowane do zadania 9

clear;
set_params;
pkt_lin = [1 -0.4 0.4];
Tp = 1;

% Wyb�r sygna�u steruj�cego 
% 0 - step od 0 do 1 w t = 1
% 1 - step od 0 do 0.5 w t = 1
% 2 - sygna� liniowo rosn�cy do nasycenia w u = 1
% 3 - bia�y szum 
selector = 3;

% Stw�rz folder na wykresy je�li jeszcze nie istnieje
if(exist('figures', 'dir') == 0)
    mkdir('figures');
end

if(exist('figures\zad9', 'dir') == 0)
    mkdir('figures\zad9');
end

for i=1:length(pkt_lin)
    % Ustawienie symulacji
    u_lin = pkt_lin(i);
    
    % Symulacja proces�w
    sim('zad9disc_lin');
    
    % Rysowanie wykresu wyj�cia
    fig1 = figure('Name', strcat('Odpowiedzi skokowe dyskretnego dla Tp = 1, Punkt pracy = ', num2str(u_lin)));
    set(gcf, 'Position', [100, 100, 800, 600])
    hold on;
    grid on;
    grid minor;
    plot(output_linear);
    plot(output_nonlin);
    legend('Model zlinearyzowany', 'Model nieliniowy', 'Location', 'northeast');
    title(['Odpowiedzi skokowe modeli dyskretnych Tp = 1, Punkt pracy u = ' num2str(u_lin)], 'FontName', 'Helvetica');
    xlabel('Czas t');
    ylabel('Wyj�cie modelu y');
    hold off;
    
    % Zapis wykresu do pliku
    name = strcat('figures\zad9\dyskr_lin_output', num2str(i), 'sel_', num2str(selector));
    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperPosition', [0 0 80 60]);
    set(gcf,'PaperPositionMode','auto');
    print(name,'-dpdf','-r400');
    
    % Wykres wymuszenia
    fig2 = figure('Name', strcat('Sygna� steruj�cy, Punkt pracy u = ', num2str(u_lin)));
    hold on;
    grid on;
    grid minor;
    plot(u_lin_vect);
    plot(u_vect_nonlin);
    hold off;
    legend( 'Sygna� zlinearyzownay', 'Sygna� nieliniowy', 'Location', 'northeast');
    xlabel('Czas t');
    ylabel('Wymuszenie obiektu');
    title(['Wymuszenia obiekt�w nieliniowego i zlinearyzowanego, Pkt pracy u = ' num2str(u_lin)], 'FontName', 'Helvetica');
    
    % Zapis wykresu do pliku
    name = strcat('figures\zad9\dyskr_lin_ster', num2str(i), 'sel_', num2str(selector));
    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperPosition', [0 0 80 60]);
    set(gcf,'PaperPositionMode','auto');
    print(name,'-dpng','-r0');
end

% Wykres sterowania u
fig3 = figure('Name', 'Sygna� steruj�cy u w czasie');
hold on;
grid on;
grid minor;
plot(u_vect);
xlabel('Czas t');
ylabel('Sygna� steruj�cy u');
title('Sygna� steruj�cy u w czasie', 'FontName', 'Helvetica');
hold off;

% Zapis wykresu do pliku
name = strcat('figures\zad9\dyskr_u_ster_sel_', num2str(selector));
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 80 60]);
set(gcf,'PaperPositionMode','auto');
print(name,'-dpng','-r0');
