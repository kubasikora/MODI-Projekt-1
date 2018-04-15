function [] = print_figure(name, d)
    % Wyjdz z folderu scripts
    folder = pwd();
    cd('../')
    
    % Stwórz folder na wykresy jeœli jeszcze nie istnieje
    if(exist('figures', 'dir') == 0)
        mkdir('figures'); 
    end
    
    if(exist(d, 'dir') == 0)
        mkdir(d); 
    end
    
    % Zapis wykresu do pliku
    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperPosition', [0 0 80 60]); %x_width=10cm y_width=15cm
    set(gcf,'PaperPositionMode','auto');
    print(name,'-dpdf','-r400');
    hold off;
    
    cd(folder) 
    
    close 
end

