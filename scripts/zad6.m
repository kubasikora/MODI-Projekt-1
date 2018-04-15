% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Skrypt rysuj�cy charakterystyki statyczne zlinearyzowane do zadania 6

clear;
set_params;
pkt_lin = [-0.4 -0.1 0.5];

for i=1:length(pkt_lin)
    % Zmiana czasu pr�bkowania
    u_p = pkt_lin(i);
    
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
    title(['Linearyzacja charakterystyki statycznej w punkcie u = ', num2str(u_p)], 'FontName', 'Helvetica');
    xlabel('Warto�� sterowania u');
    ylabel('Wyj�cie modelu y');
    
    name = strcat('figures\zad6\char_zlin_', num2str(i));
    print_figure(name, 'figures\zad6')
    
end
