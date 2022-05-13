%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

%% Esta funcion toma los desplazamientos globales de cada elemento, los transforma a coordenadas
% locales y aplica una interpolación para aoriximar la deformación del
% elemento. Por ultimo aplica una rotacion y una traslacion al elementos
% para ubicarlo en su respectiva posicion

%%  ENTRADAS:
        % Desplazamientos: MAtriz de desplazamientos globales de la
        %estructura (n x 4)
        % elemento: vector del elemento (1 x 6)
        % nodos: Matriz de nodos de la estructura (n x 4)
        % L: Valor de la longitud del elemento
        % ang: Valor del angulo del elemento
        % factor: Factor de multiplicacion de los desplazamientos
      
function graficar_defor(Desplazamientos,elemento,nodos,L,ang,factor)

%% Encontrar los nodos respectivos al elementos
D = [find(Desplazamientos(:,2) == elemento(2));
    find(Desplazamientos(:,2) == elemento(3))];

%% Matriz de rotacion
T = [cos(ang) sin(ang) 0 0 0 0;
    -sin(ang) cos(ang) 0 0 0 0;
    0 0 1 0 0 0;
    0 0 0 cos(ang) sin(ang) 0;
    0 0 0 -sin(ang) cos(ang) 0;
    0 0 0 0 0 1];


%% datos para traslacion
N = nodos(elemento(2),:);

%% extraer las deformaciones del nodo
Des = Desplazamientos(D,4);


Des = T * Des;



%% Hallar los valores del polinomio
X = [0 0 0 1;
    L^3 L^2 L 1;
    0 0 1 0;
    3*L^2 2*L 1 0];
%Des(2) Des(5)
Y = [Des(2) Des(5) Des(3) Des(6)]';

A = inv(X)* Y;

%% Generar los puntos 
x = (0+(Des(1)*factor):0.01:L+(Des(4)*factor));

y = A(1)*x.^3 + A(2)*x.^2 + A(3)*x + A(4);

%% Amplificar las deformaciones
y = y * factor;

%% matriz de puntos
pts = [x;y;zeros(1,length(y));ones(1,length(y))];

%% Matriz de rotacion
Mr = [cos(ang) -sin(ang) 0 0;
    sin(ang) cos(ang) 0 0;
    0 0 1 0;
    0 0 0 1];

%% matriz de traslación
Mt = [1 0 0 N(2);
    0 1 0 N(3);
    0 0 1 0;
    0 0 0 1];

%% Matriz de transformacion
M = Mt * Mr;


pts = M * pts;


plot(pts(1,:),pts(2,:),'r');

end
