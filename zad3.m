% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt rysuj�cy wykresy do zadania 3 

clear;
set_params; % ustawienie parametr�w modeli
Tp_vect = [0.1 0.2 0.5 1 2 5]; % wektor okres�w pr�bkowania
interactive = 0; %ustawi� na warto�� niezerow� aby pracowa� w trybie interaktywnym

for i=1:length(Tp_vect)
    % Zmiana czasu pr�bkowania
    Tp = Tp_vect(i);
    
    % Obs�uga u�ytkownika
    if(i~=1 && interactive ~= 0) 
        input('Wcisnij klawisz aby kontynuowa�...'); 
    end
    disp(['Rysuj� wykres odpowiedzi skokowych dla modelu ci�g�ego i dyskretnego o Tp = ', num2str(Tp)]);
    
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
    
    % Stw�rz folder na wykresy je�li jeszcze nie istnieje
    if(exist('figures', 'dir') == 0)
        mkdir('figures'); 
    end
    
    % Zapis wykresu do pliku
    name = strcat('figures\skok_Tp_', num2str(i));
    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperPosition', [0 0 80 60]); %x_width=10cm y_width=15cm
    set(gcf,'PaperPositionMode','auto');
    print(name,'-dpng','-r0');
    hold off;
end
