% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt rysuj¹cy charakterystyki dynamiczne zlinearyzowane do zadania 9

clear;
set_params;
pkt_lin = [1 -0.4 0.4];
Tp = 1;

% Wybór sygna³u steruj¹cego 
% 0 - step od 0 do 1 w t = 1
% 1 - step od 0 do 0.5 w t = 1
% 2 - sygna³ liniowo rosn¹cy do nasycenia w u = 1
% 3 - bia³y szum 
selector = 0;

for s=0:3
    selector = s;
    
    for i=1:length(pkt_lin)
        % Ustawienie symulacji
        u_lin = pkt_lin(i);
        
        % Symulacja procesów
        sim('zad9disc_lin');
        
        % Rysowanie wykresu wyjœcia
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
        ylabel('Wyjœcie modelu y');
        hold off;
        
        name = strcat('figures\zad9\', 'sel_', num2str(selector), '_dyskr_lin_output_', num2str(i));
        print_figure(name, 'figures\zad9')
        
        % Wykres wymuszenia
        fig2 = figure('Name', strcat('Sygna³ steruj¹cy, Punkt pracy u = ', num2str(u_lin)));
        hold on;
        grid on;
        grid minor;
        plot(u_lin_vect);
        plot(u_vect_nonlin);
        hold off;
        legend( 'Sygna³ zlinearyzownay', 'Sygna³ nieliniowy', 'Location', 'northeast');
        xlabel('Czas t');
        ylabel('Wymuszenie obiektu');
        title(['Wymuszenia obiektów nieliniowego i zlinearyzowanego, Pkt pracy u = ' num2str(u_lin)], 'FontName', 'Helvetica');
        
        % Zapis wykresu do pliku
        name = strcat('figures\zad9\sel_', num2str(selector), 'dyskr_lin_ster_', num2str(i));
        print_figure(name, 'figures\zad9')
    end
    
    % Wykres sterowania u
    fig3 = figure('Name', 'Sygna³ steruj¹cy u w czasie');
    hold on;
    grid on;
    grid minor;
    plot(u_vect);
    xlabel('Czas t');
    ylabel('Sygna³ steruj¹cy u');
    title('Sygna³ steruj¹cy u w czasie', 'FontName', 'Helvetica');
    hold off;
    
    name = strcat('figures\zad9\sel_', num2str(selector), '_dyskr_u_ster');
    print_figure(name, 'figures\zad9')

end
