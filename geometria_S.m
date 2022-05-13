%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

function [ang,L] = geometria_S(N,E)

%% función que recibe la mtriz de nodos y elementos y devuelve un vector N x 2 con los angulos de cada elemento y sus longitudes
%% ENTRADAS:
%   N: Matriz de nodos. Matriz N x 3 donde el índice i,1 es el numero del
%   nodo y los aubindices i,2 e i,3 son las coordenadas x y y
%   respectivamente
%   E: matriz de elementos que iondica como se unen con los nodos
%% SALIDAS:
%   ang: vector N x 2 que contine el ángulo (en radianes) de cada elemento i con respecto
%   a la horizontal y su longitud

[n_elem,n_colum] = size(E);
ang = zeros(n_elem,1);
L = zeros(n_elem,1);

for j = 1:n_elem
    
    %% Encontrando los nodos que une el elemento i
    n1 = E(j,2);
    n2 = E(j,3);
    %% Obteniendo informacion de las coordenadas de ambos nodos
    P1 = [N(n1,2) N(n1,3)];
    P2 = [N(n2,2) N(n2,3)];
    %% Se haya dx y dy para formar el triangulo 
    dx = P2(1) - P1(1);
    dy = P2(2) - P1(2);
    %% Se crea el numero complejo
    Z = dx + dy*1i;
    %% Se halla el angulo
    ang(j) = angle(Z);
    %% Las longitudes
    L(j) = abs(Z);
end
    
    