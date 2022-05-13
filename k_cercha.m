%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

function K = k_cercha(E,L,A,theta)
%% Función que calcula la matriz de rigidez de un elemento cercha
%% ENTRADAS:
%   E: El valor del módulo de young del elemento
%   L: Longitud del elemento
%   A: Area transversal del elemento
%   theta: angulo del elemento con respecto al eje positivo x
%% SALIDAS:
%   K: Matriz de rigidez del elemento

K = A*E/L * [cos(theta)^2 cos(theta)*sin(theta) -cos(theta)^2 -cos(theta)*sin(theta);
    cos(theta)*sin(theta) sin(theta)^2 -cos(theta)*sin(theta) -sin(theta)^2;
    -cos(theta)^2 -cos(theta)*sin(theta) cos(theta)^2 cos(theta)*sin(theta);
    -cos(theta)*sin(theta) -sin(theta)^2 cos(theta)*sin(theta) sin(theta)^2];
end
