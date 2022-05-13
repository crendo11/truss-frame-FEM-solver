%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

function [Fuerzas_elementos] = sol_fuerzas_elementos(K,ind,B)
%% Calcula las fuerzas locales para cada elemento a paritr de los desplazamientos en los respectivos nodos
%%  ENTRADAS:  
%       K: Arreglo de matrices locales para cada elemento
%       ind: Arreglo de vectores con los indices globales de cada elemento
%       B: Matriz N x 4 de condiciones de frontera solucionada
%%  SALIDAS:
%       Fuerzas_elementos: Arreglo de matrices de fuerzas nodales para cada
%       elemento

for i = 1:length(K)
    %% Llena una matriz con los nodos y las direcciones de las fuerzas
    Fuerzas = B(ind{i},1:3);
    %% Soluciona la ecuacion Ku = f para cada elemento y lo agrega a la columna 4
    Fuerzas(:,4) = K{i} * B(ind{i},4);
    Fuerzas_elementos{i} = Fuerzas;
end

end
