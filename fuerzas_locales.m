%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================
%% Funcion que aplica la matriz de rotacion a las fuerzas nodales globales para cada elemeto
%%  ENTRADAS:
        %Fuerzas_g: Matriz de fuerzas nodales de cada elemento en coordenadas globales
        % ang: angulo con respecto a x de cada elemento elemento
%%  SALIDAS:
        % fuerzas_l: Matriz con las fuerzas locales de cada
        % elemento
function fuerzas_l = fuerzas_locales(Fuerzas_g,theta,tipo_estructura)

global PORTICO
global CERCHA

%% Igualo las matrices para mantener lo nodos ylas direcciones siendo 
fuerzas_l = Fuerzas_g;

switch tipo_estructura
    case PORTICO
        %% Matriz de transformacion
        M = [cos(theta) sin(theta) 0 0 0 0;
            -sin(theta) cos(theta) 0 0 0 0;
            0 0 1 0 0 0;
            0 0 0 cos(theta) sin(theta) 0;
            0 0 0 -sin(theta) cos(theta) 0;
            0 0 0 0 0 1];
    case CERCHA
        M = [cos(theta) sin(theta) 0 0;
            -sin(theta) cos(theta) 0 0;
            0 0 cos(theta) sin(theta);
            0 0 -sin(theta) cos(theta)];
end
        
        %% Aplico la transformación a la cuarta columna de fuerzas_l
        fuerzas_l(:,4) = M * fuerzas_l(:,4);
        
end




