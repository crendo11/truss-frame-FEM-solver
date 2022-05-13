%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

function plot_sys(N,E,caracter)
%funcion que dibuja el sistema con sus condicones iniciales
%ETRADAS:
%   N: Matrix(nx3) que contiene el indice del nodo y sus posiciones en 'x' y
%   'y'
%   E: Matriz(nx6) que contiene los elementos y los nodos que conectan
%   caracter: Caracteristicas de la grafica, tipo de line, color etc
n = size(E,1);
hold on
grid on
for i = 1:n     %n es la cantidad de filas de la matriz de elementos E
    
    n1 = E(i,2);    %se lee la matriz E en su segunda columna para encontrar el n1 que se conecta con n2
    n2 = E(i,3);    %se lee la mtriz E en su tercera posicion para encontrar n2
    
    %% Se guardan las coordenasdas de los puntos
    P1 = [N(n1,2),N(n1,3)]; 
    P2 = [N(n2,2),N(n2,3)]; 
    
    %% Se plotean los puntos
    plot([P1(1) P2(1)],[P1(2) P2(2)],caracter)
    
    %% Textos de los nodos
    %text(N(n1,2)+0.1,N(n1,3)+0.1,int2str((N(n1,1))))
    text((N(n1,2)+N(n2,2))/2+0.1,(N(n1,3)+N(n2,3))/2+0.1,int2str(i))
end


