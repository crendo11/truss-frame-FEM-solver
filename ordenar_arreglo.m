%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

function M = ordenar_arreglo(A)
%% Esta funciuion devuelve una matriz o vector columna ordenado de forma ascendente conrespecto a su
% primera columna
%%  ENTRADAS:
%       N: Matriz (N x M) a ordenar
%%  SALIDAS:
%       M: Matriz (N x M) ordenada

n = size(A,1);

for i = 1:n
    for j = 1:n-i
        if A(j,1) > A(j+1,1)
            aux = A(j,:);
            A(j,:) = A(j+1,:);
            A(j+1,:) = aux;
        end
    end
end
M = A;
end
