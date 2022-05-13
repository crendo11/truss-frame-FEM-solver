%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

%% Grafica el diagram de cortante del elemento
%%  ENTRADAS:
        % Fuerzas_L: Fuerzas en el elemento con respecto al sistema de
        % coordenadas local
        % L: Longitud del elemento
        % c_diagrama: Color del diagrama
        % c_elemento: Color del elemento
        
function diagrama_cortante(Fuerzas_L,L,c_diagrama,c_elemento)

%% Tomar la fuerza cortante en el nodo 1 Y 2
F1 = Fuerzas_L(2,4);
F2 = Fuerzas_L(5,4);
%% Se crean los puntos para graficar

%% De 0,0 a cortante
inicial = [0,0];
c1 = [0,F1];

%% De cortante en nodo 1 a cortante en nodo 2
c2 = [L,-F2];
%% Nodo 2
n2 = [L,0];

%% Nodo 1
n1 = [0,0];

%% Matriz del diagrama para graficar
V = [inicial;c1;c2;n2];

%% Calcular los valores maximos y minimos de los ejes
XMIN = -0.5;
XMAX = L+0.5;

if F1 < 0
    YMIN = F1 - 1;
    YMAX = 0.5;
else
    YMIN = -0.5;
    YMAX = F1 + 1;
end

%% Graficando
plot(V(:,1),V(:,2),c_diagrama)
xlabel('X(m)')
ylabel('V(N)')
title('Diagrama de cortante')
hold on

%% Grafica el elemento del color deseado con un espesor de linea mas grande
plot([0 L],[0 0],c_elemento,'LineWidth',2.5)
%axis([XMIN XMAX YMIN YMAX])
end
