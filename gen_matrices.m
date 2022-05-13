%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

function [N,E,B,F] = gen_matrices(Nodos,Elemen,Bound,Fuerza)

%Función que entrega las matricees 
%% Entradas:
%   Nodos: string con el nombre del archivo .txt de la matriz de nodos
%   Elemen: string con el nombre del archivo .txt de la matriz de elementos
%   Bound: string con el nombre del archivo .txt de la matriz de
%   condiciones de frontera
%   Fuerza: string con el nombre del archivo .txt de la matriz de fuerzas
%% Salidas
%   N: Matriz de nodos
%   E: Matriz de elementos
%   B: Matriz de condiciones de frontera
%   F: Matriz de fuerzas

N = load(Nodos);
E = load(Elemen);
B = load(Bound);
F = load(Fuerza);

N = ordenar_arreglo(N);
E = ordenar_arreglo(E);
end
