% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt rysuj¹cy wykresy do zadania 3 

clear;
set_params; % ustawienie parametrów modeli
Tp_vect = [0.1 0.2 0.5 1 2 5]; % wektor okresów próbkowania
selector = 0;

for i=1:length(Tp_vect)
    % Zmiana czasu próbkowania
    Tp = Tp_vect(i);
    
    % Symulacja procesów
    sim('zad3_sim');
    
    % Rysowanie wykresu
    fig = figure('Name', strcat('Odpowiedzi skokowe modelu ciaglego i dyskretnego dla Tp =' ,num2str(Tp))); 
    set(gcf, 'Position', [100, 100, 800, 600])
    hold on;
    grid on;
    grid minor;
    plot(cont_out);
    plot(disc_out);
    legend('Model ci¹g³y', 'Model dyskretny', 'Location', 'northeast');
    title(['Odpowiedzi skokowe modelu ci¹g³ego i dyskretnego dla Tp =' num2str(Tp)], 'FontName', 'Helvetica');
    xlabel('Czas t');
    ylabel('Wyjœcie modelu y');
    
    % Stwórz folder na wykresy jeœli jeszcze nie istnieje
    if(exist('figures', 'dir') == 0)
        mkdir('figures'); 
    end
    
    if(exist('figures\zad3', 'dir') == 0)
        mkdir('figures\zad100'); 
    end
    
    % Zapis wykresu do pliku
    name = strcat('figures\zad3\skok_Tp_', num2str(i));
    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperPosition', [0 0 80 60]); %x_width=10cm y_width=15cm
    set(gcf,'PaperPositionMode','auto');
    print(name,'-dpdf','-r400');
    hold off;
end
