%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

function K = k_portico(E,L,A,I,theta)
%% Función que calcula la matriz de rigidez de un elemento cercha
%% ENTRADAS:
%   E: El valor del módulo de young del elemento
%   L: Longitud del elemento
%   A: Area transversal del elemento
%   I: Inercia del elemento
%   theta: angulo del elemento con respecto al eje positivo x
%% SALIDAS:
%   K: Matriz de rigidez del elemento


%% COMENTAR
T = [cos(theta) sin(theta) 0 0 0 0;
    -sin(theta) cos(theta) 0 0 0 0;
    0 0 1 0 0 0;
    0 0 0 cos(theta) sin(theta) 0;
    0 0 0 -sin(theta) cos(theta) 0;
    0 0 0 0 0 1];

K1 = [A*L 0 0 -A*L 0 0;
    0 12*I/L 6*I 0 -12*I/L 6*I;
    0 6*I 4*I*L 0 -6*I 2*I*L;
    -A*L 0 0 A*L 0 0;
    0 -12*I/L -6*I 0 12*I/L -6*I;
    0 6*I 2*I*L 0 -6*I 4*I*L];

K = E/(L^2) * (T' * K1 * T);

end