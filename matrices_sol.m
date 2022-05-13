%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

function [B,F] = matrices_sol(front,fuer,tipo_sistema)
%% Funcion que entrega matrices de desplazamientos y fuerzas externas con la informacion de los nodos
%%  ENTRADAS:
%       front: (N x 1) vector con los desplazamientos nodales las
%       posiciones i son los indices de cada desplazamiento
%       tipo_estructura: tipo de estructura ya sea cercha o portico
%%  SALIDAS:
%       B: matriz N x 4 con los nodos y los desplazamientos en cada direccion
%       F: matriz N x 4 con los nodos y las fuerzas externas en cada direccion

global CERCHA
global PORTICO
global x_
global y_
global z_

%% determinar si las dimensiones de los vectores son iguales
n_front = length(front);
n_fuer = length(fuer);

if n_front == n_fuer
    %% genera las matrices vacias
    B = zeros(n_front,4);
    F = zeros(n_fuer,4);
    %% agrega los subindices en la primera columna
    B(:,1) = (1:n_front);
    F(:,1) = (1:n_front);
    %% Se analiza el tipo de estructura
    switch tipo_sistema
        case CERCHA
            for i = 1:2:n_front - 1
                %% Pone en la columna 3 de cad amatriz los indices de los nodos
                B(i:i+1,2) =  [(i+1)/2 (i+1)/2]';
                F(i:i+1,2) =  [(i+1)/2 (i+1)/2]';
                %% Pone en la 3 columna de cada matriz la direccion de la fuerza o el desplazamiento
                B(i:i+1,3) = [x_ y_]';
                F(i:i+1,3) = [x_ y_]';
            end
            B(:,4) = front;
            F(:,4) = fuer;
        case PORTICO
            for i = 1:3:n_front - 2
                %% Pone en la columna 3 de cada matriz los indices de los nodos
                B(i:i+2,2) =  [(i+2)/3 (i+2)/3 (i+2)/3]';
                F(i:i+2,2) =  [(i+2)/3 (i+2)/3 (i+2)/3]';
                %% Pone en la 3 columna de cada matriz la direccion de la fuerza o el desplazamiento
                B(i:i+2,3) = [x_ y_ z_]';
                F(i:i+2,3) = [x_ y_ z_]';
            end
            B(:,4) = front;
            F(:,4) = fuer;
        otherwise
            'matrices_sol(): Error en tipo de estructura'
            keyboard
    end
else
    'matrices_sol): los vectores de desplazamientos y fuerzas deben tener las mismas dimensiones'
    keyboarb
end
end
    