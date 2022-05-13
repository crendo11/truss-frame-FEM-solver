%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

%% Funcion que usa un for para graficar la estructura deformada
%%  ENTRADAS:
        % N: Matriz de nodos (n x 4)
        % E: Matriz de elementos (n x 6)
        % L: Vector de longitudes de cada elemento (n x 1)

function graficar_sistema(N,E,L,ang,Fescalar,Des)

n = size(E,1);

hold on

for i = 1:n
    graficar_defor(Des,E(i,:),N,L(i),ang(i),Fescalar)
end

end
