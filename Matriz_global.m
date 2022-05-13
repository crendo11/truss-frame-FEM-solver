%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

%% Funcion que calcula la matriz global del sistema encontrando las matrices 
% locales de cada elemento y los indices asociados a la global
%% ENTRADAS:
%   N: (N x 3) Matriz de nodos del sistema
%   E: (N x 6) matriz de elementos
%   tipo_estructura: CERCHA o PORTICO segun sea el caso
%% SALIDAS:
%   glob_K: Matriz de rigidez global
%   k: Arreglo de matrices locales para cada elemento
%   ind: Arreglo de indices globales para cada material
%   ang: Vector de angulos paracada elemento
%   L: Vector con las longitudes de cada elemento

function [glob_K,k,ind,ang,L] = Matriz_global(N,E,tipo_estructura)

%% Definiendo variables
global CERCHA
global PORTICO
global E_
global A_
global I_

%% Numero de elemetos y calculo de la geometria
[ang,L] = geometria_S(N,E);
n_elem = size(E,1);

switch tipo_estructura
    case CERCHA
        n_grados = size(N,1) * 2;
        glob_K = zeros(n_grados);
        %% Se calculan las matrices locales de cada elemento
        for i = 1:n_elem
            k{i} = k_cercha(E(i,E_),L(i),E(i,A_),ang(i));
        end
        %% se hallan los índices globales para ingresarlos a la funcion de ensamblar matriz global
        for i = 1:n_elem
            %% Nodos que une el elemento
            n1 = E(i,2);
            n2 = E(i,3);
            
            %% Ecuentra los grados de liertad relacionados con cada nodo
            a = n1 * 2 - 1;
            b = n1 * 2;
            c = n2 * 2 - 1;
            d = n2 * 2;
            ind{i} = [a b c d];
            
            %% Ensambla la matriz global
            glob_K = ensamblar_K(glob_K,k{i},ind{i});
        end
    case PORTICO
        %% Procedimiento del portico
        n_grados = size(N,1) * 3;
        glob_K = zeros(n_grados);
        %% Se calculan las matrices locales de cada elemento
        for i = 1:n_elem
            k{i} = k_portico(E(i,E_),L(i),E(i,A_),E(i,I_),ang(i));
        end
        %% se hallan los índices globales para ingresarlos a la funcion de ensamblar matriz global
        for i = 1:n_elem
            %% Nodos que une el elemento
            n1 = E(i,2);
            n2 = E(i,3);
            
            %% Ecuentra los grados de liertad relacionados con cada nodo
            a = n1 * 3 - 2;
            b = n1 * 3 - 1;
            c = n1 * 3;
            d = n2 * 3 - 2;
            e = n2 * 3 - 1;
            f = n2 * 3;
            ind{i} = [a b c d e f];
            
            %% Ensambla la matriz global
            glob_K = ensamblar_K(glob_K,k{i},ind{i});
        end
        
    otherwise
        'Matriz_global(): Error en tipo de estructura'
        keyboard
end


end
