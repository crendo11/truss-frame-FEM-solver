%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

%% Funcion que grafica, en una sola figura, los diagramas de cortantes, momentos y axiales de un elemento i

function graficar_diagramas(Fuerzas_L,L,i)

titulo = sprintf('Diagramas del elemento %d',i);


figure
set(gcf,'Name',titulo)

subplot(3,1,1)
diagrama_axial(Fuerzas_L,L,'b','r')

subplot(3,1,2)
diagrama_cortante(Fuerzas_L,L,'b','r')

subplot(3,1,3)
diagrama_momentos(Fuerzas_L,L,'b','r')

end
