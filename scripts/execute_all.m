% MODI - Projekt 1 - Zadanie 36 - Jakub Sikora
% Uruchamia wszystkie skrypty generuj¹ce wykresy

zad3;
zad4;
zad6;
zad9;
zad11;
zad12;


% Otwórz reprezentacje graficzna zadania 1
open_system('zad1v2');
set_param('zad1v2', 'PaperType', 'usletter');
set_param('zad1v2', 'PaperOrientation', 'landscape');
set_param('zad1v2', 'PaperPositionMode', 'manual');
set_param('zad1v2', 'PaperPosition', [0.5 0.5 4 4]);
folder = pwd();
cd('../')

% Stwórz folder na wykresy jeœli jeszcze nie istnieje
    if(exist('figures', 'dir') == 0)
        mkdir('figures'); 
    end
    
    if(exist('figures\zad1', 'dir') == 0)
        mkdir('figures\zad1'); 
    end
    
% Zapisz model
print('-szad1v2', 'figures\zad1\system', '-dpdf', '-r400')
cd(folder)
bdclose 


% Otwórz reprezentacje graficzna zadania 8
open_system('zad8');
set_param('zad8', 'PaperType', 'usletter');
set_param('zad8', 'PaperOrientation', 'landscape');
set_param('zad8', 'PaperPositionMode', 'manual');
set_param('zad8', 'PaperPosition', [0.5 0.5 4 4]);
folder = pwd();
cd('../')

% Stwórz folder na wykresy jeœli jeszcze nie istnieje
    if(exist('figures', 'dir') == 0)
        mkdir('figures'); 
    end
    
    if(exist('figures\zad8', 'dir') == 0)
        mkdir('figures\zad8'); 
    end
    
% Zapisz model
print('-szad8', 'figures\zad8\system', '-dpdf', '-r400')
cd(folder)
bdclose 


