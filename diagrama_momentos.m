%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

%% Grafica el diagrama de momentos del elemento
%%  ENTRADAS:
        % Fuerzas_L: Fuerzas en el elemento con respecto al sistema de
        % coordenadas local
        % L: Longitud del elemento
        % c_diagrama: Color del diagrama
        % c_elemento: Color del elemento
      

function diagrama_momentos(Fuerzas_L,L,c_diagrama,c_elemento)


%% Tomar el momenro en el nodo 1 y 2
F1 = Fuerzas_L(3,4);
F2 = Fuerzas_L(6,4);
%% Se crean los puntos para graficar

%% De 0,0 a cortante
inicial = [0,0];
c1 = [0,-F1];

%% De cortante en nodo 1 a cortante en nodo 2
c2 = [L,F2];
%% Nodo 2
n2 = [L,0];

%% Nodo 1
n1 = [0,0];

%% Matriz del diagrama para graficar
M = [inicial;c1;c2;n2];


%% Graficando
plot(M(:,1),M(:,2),c_diagrama)
xlabel('X(m)')
ylabel('M(N.m)')
title('Bending Moment Diagram')
hold on

%% Grafica el elemento del color deseado con un espesor de linea mas grande
plot([0 L],[0 0],c_elemento,'LineWidth',2.5)

end