%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

%% Soluciona las incognitas o varibles desconocidas del sistema
%%  ENTRADAS:
%       ucon: vector N x 2 con los indices de los desplzamaientos conocidos
%       y sus valores
%       udes: vector N x 1 con los indices de los desplzamaientos desonocidos
%       fcon: vector N x 1 con los indices de las fuerzas conocidas y sus valores 
%       
%%  SALIDAS:
%       Front: Matriz de desplazamientos nodales del sistema (N x 4)
%       Fuer: Matriz de fuerzas externas del sistema (N x 4)

function [Front,Fuer] = solucionar_sis(ucon,udes,fcon,K_glob)


%% Para facilitar la escritura de la formula
uc = ucon(:,1);

%% Arreglo las fuerzas conocidas en sus posiciones reales
Fuer(udes) = fcon(:,2);
Front(uc) = ucon(:,2);
Front(udes) = K_glob(udes,udes)\((fcon(:,2) - K_glob(udes,uc) * ucon(:,2)));
Front = Front';
Fuer(uc) = K_glob(uc,udes) * Front(udes) + K_glob(uc,uc) * Front(uc);
Fuer = Fuer';
