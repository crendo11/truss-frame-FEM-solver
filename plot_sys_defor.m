%=========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

%% Grafica el sitema con los desplazamientos nodales amplificador por un factor multiplicador

%%  ENTRADAS:
%       Defor: Matriz de desplazamientos nodales de la etructura
%       E: Matriz de elementos
%       N: Matriz de nodos
%       Fescalar: factor multiplicador
%       Caracter: Caracteristicas del grafico
        
function  plot_sys_defor(Defor,E,N,Fescalar,caracter)

%% Variables globales
global x_
global y_

%% Suma a las coordenadas de cada nodo los desplazamientos

%% Encuentra los indices de los desplazamientos en X y en Y
X = find(Defor(:,3) == x_);
Y = find(Defor(:,3) == y_);

%% Crea los valores de los desplazamientos multiplacados por el factor
desx = Defor(X,4) * Fescalar;
desy = Defor(Y,4) * Fescalar;

%% Suma a las coordenadas de cada nodo el desplazamiento
N(:,2) = N(:,2) + desx;
N(:,3) = N(:,3) + desy;

%% Graficar
plot_sys(N,E,caracter)
        
end    
        
        
        
        