
%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

%% Funcion que encuentra los indices de las variables desconocidas a partir de las conocidas
%% ENTRADAS:
%   M: Matriz, ya sea de fuerzas o condiciones de fronteras conocidas
%   n_grados: Numero de grados de libertad del sistema
%   tipo_estructura: Cercha o portico
%% SALIDAS:
%   con: vector de variables conocidas
%   des: vector de variables desconocidas

function [con,des] = variables_conocidas(M,n_grados,tipo_estructura)


global CERCHA
global PORTICO

switch tipo_estructura
    case CERCHA
        %%  si es una cercha lo que hace es multiplicar el nodo por 2 y restarle (2 - el grado de libertad) 
        for i = 1:size(M,1)
        con(i,1) = M(i,2) * 2 - (2 - M(i,3));
        con(i,2) = M(i,4);
        end
    case PORTICO
        %% si es un portico lo que hace es multiplicar el nodo por 3 y restarle (3 - el grado de libertad)
        for i = 1:size(M,1)
        con(i,1) = M(i,2) * 3 - (3 - M(i,3));
        con(i,2) = M(i,4);
        end
end

des = (1:n_grados)';

for i = 1:length(con)
    a = find(des == con(i));
    des(a) = [];
end
con = ordenar_arreglo(con);
des = ordenar_arreglo(des);

end