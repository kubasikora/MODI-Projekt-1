% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt rysuj�cy wykresy do zadania 3 

clear;
set_params; % ustawienie parametr�w modeli
Tp_vect = [0.1 0.2 0.5 1 2 5]; % wektor okres�w pr�bkowania
selector = 0;

for i=1:length(Tp_vect)
    % Zmiana czasu pr�bkowania
    Tp = Tp_vect(i);
    
    % Symulacja proces�w
    sim('zad3_sim');
    
    % Rysowanie wykresu
    fig = figure('Name', strcat('Odpowiedzi skokowe modelu ciaglego i dyskretnego dla Tp =' ,num2str(Tp))); 
    set(gcf, 'Position', [100, 100, 800, 600])
    hold on;
    grid on;
    grid minor;
    plot(cont_out);
    plot(disc_out);
    legend('Model ci�g�y', 'Model dyskretny', 'Location', 'northeast');
    title(['Odpowiedzi skokowe modelu ci�g�ego i dyskretnego dla Tp =' num2str(Tp)], 'FontName', 'Helvetica');
    xlabel('Czas t');
    ylabel('Wyj�cie modelu y');
    
    name = strcat('figures\zad3\skok_Tp_', num2str(i));
    print_figure(name, 'figures\zad3')
end

