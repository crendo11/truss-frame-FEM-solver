%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

%% Esta funcion calcula los esfuerzos axiales y cortantes  

%%  ENTRADAS:
        %Fuerzas: Matriz de fuerzas del elemento en coordenadas globales
        %A: Area del elemento
        %I: Inercia del elemento
        
%%  SALIDAS:
        %axial: Esfuerzo axial en elemento
        %cortante: Esfuerzo cortante en el elemento
        %flector: Esfuerzo por momento flector en el elemento (valor absoluto)
        
        
 function [axial,cortante,flector] = esfuerzos(Fuerzas,A,I,tipo_estructura)
        
 global PORTICO
 global CERCHA
 
 switch tipo_estructura
     case {PORTICO}
         
         %% Esfuerzo cortante
         V = Fuerzas(2,4);
         cortante = V/A;
         
         %% esfuerzo axial
         F = -Fuerzas(1,4);
         axial = F/A;
         
         %% Esfuerzo axial por momento flector
         h = sqrt(12*I/A);
         M = max(abs([Fuerzas(3,4) Fuerzas(6,4)]));
         c = h/2;
         flector = M*c/I;
         
     case CERCHA
         axial = -Fuerzas(1,4)/A;
         cortante = 0;
     otherwise
         'esfuerzos(): Error en tipo de estructura'
         keyboard
 end
 
 
 end
