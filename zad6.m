% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt rysuj¹cy charakterystyki statyczne zlinearyzowane do zadania 6

clear;
set_params;
pkt_lin = [-0.4 -0.1 0.5];
interactive = 0;

for i=1:length(pkt_lin)
    % Zmiana czasu próbkowania
    u_p = pkt_lin(i);
    
    % Obs³uga u¿ytkownika
    if(i~=1 && interactive ~= 0) 
        input('Wcisnij klawisz aby kontynuowaæ...'); 
    end
    disp(['Wybrany punkt pracy u_lin = ', num2str(u_p)]);
    
    % Charakterystyka nieliniowa
    u = linspace(-1,1,100);
    y = K*(a1*u + a2*(u.^2) + a3*(u.^3) + a4*(u.^4));
    u_lin = K*a1*u + K*(a2*(u_p^2) + a3*(u_p^3) + a4*(u_p^4)) + K*(u - u_p)*(2*a2*u_p + 3*a3*(u_p^2) + 4*a4*(u_p^3));
    
    % Rysowanie wykresu
    fig = figure('Name', 'Zlinearyzowana charakterystyka statyczna');
    set(gcf, 'Position', [100, 100, 800, 600])
    hold on;
    grid on;
    grid minor;
    plot(u,y);
    plot(u, u_lin);
    legend('Charakerystyka statyczna', 'Charakterystyka zlinearyzowana', 'Location', 'northeast');
    title('Linearyzacja charakterystyki statycznej', 'FontName', 'Helvetica');
    xlabel('Wartoœæ sterowania u');
    ylabel('Wyjœcie modelu y');
    
    % Stwórz folder na wykresy jeœli jeszcze nie istnieje
    if(exist('figures', 'dir') == 0)
        mkdir('figures'); 
    end
    
    % Zapis wykresu do pliku
    name = strcat('figures\char_zlin_', num2str(i));
    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperPosition', [0 0 80 60]); %x_width=10cm y_width=15cm
    set(gcf,'PaperPositionMode','auto');
    print(name,'-dpng','-r0');
    hold off;
end

