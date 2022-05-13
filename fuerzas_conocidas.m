%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

%% Funcion que encuentra los indices de las fuerzas conocidas y las desconocidas
% ademas tiene en cuenta que el usuario no ingresa las fuerzas externas
% que son 0
%%  ENTRADAS:
        % udes: vector con los indices de los desplazamientos desconocidos
        % que son los mismos indices de las fuerzas conocidas
        % M: Matriz de fuerzas
        % n_grados: numero de grados de libertad
        % tipo_estructura: Tipo de estructura Cercha o Portico
%%  SALIDAS:
        % con: matriz (N x 2) con los indices de las fuerzas conocidas y
        % los valores
        % des: vector con los indices de las fuerzas conocidas
        
function [con,des] = fuerzas_conocidas(udes,M,n_grados,tipo_estructura)

global CERCHA
global PORTICO

n_desconocidas = length(udes);
n_fuerzas = size(M,1);

%% Si son iguales significa que todas las fuerzas estánd definidas 
if n_desconocidas == n_fuerzas
    [con,des] = variables_conocidas(M,n_grados,tipo_estructura);
else
    %% Si no son iguales hay nodos con fuerza externa == 0
    switch tipo_estructura
        
    case CERCHA
        
        %%  si es una cercha lo que hace es multiplicar el nodo por 2 y restarle (2 - el grado de libertad) 
        for i = 1:n-fuerzas
        con(i,1) = M(i,2) * 2 - (2 - M(i,3));
        con(i,2) = M(i,4);
        
        %% Borro los desplazamientos conocidos para luego concatenar lo que falten por conocer en las fuerzas
        C = find(udes == con(i,1));
        udes(C) = [];
        end
        
        %% Los que faltan por conocer en las fuerzas se asumen como 0
        con = [con;
            udes zeros(length(udes),1)];
    case PORTICO
        
        %% si es un portico lo que hace es multiplicar el nodo por 3 y restarle (3 - el grado de libertad)
        for i = 1:size(M,1)
        con(i,1) = M(i,2) * 3 - (3 - M(i,3));
        con(i,2) = M(i,4);
        
        %% Borro los desplazamientos conocidos para luego concatenar lo que falten por conocer en las fuerzas
        C = find(udes == con(i,1));
        udes(C) = [];
        end
        
        %% Los que faltan por conocer en las fuerzas se asumen como 0
        con = [con;
            udes zeros(length(udes),1)];
    end
    
    %% Crea un vector de 1 hasta el numero de varibles para luego eliminar las conocidas
    des = (1:n_grados)';

for i = 1:length(con)
    %% Elimina los indices de las variabls conocidas del vector de desconocidas
    a = find(des == con(i));
    des(a) = [];
end

%% Ordena las matrices
con = ordenar_arreglo(con);
des = ordenar_arreglo(des);
    
end
    