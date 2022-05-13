%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

%% Funcion que ensambla la matriz k local en la matriz K global
%% ENTRADAS:
%   K_glob: Matriz de rigidez global a la que se le ensamblara la matriz k
%   local
%   K: Matriz K local que se ensambla a K
%   I: Vector fila con los subindices de la matriz global [u1x u1y u1z u2x u2y u3z]

function K_ens = ensamblar_K(K_glob,K,I)

K_glob(I,I) = K_glob(I,I) + K;
K_ens = K_glob;