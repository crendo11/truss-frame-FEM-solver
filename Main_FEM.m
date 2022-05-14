%==========================================================================
% Andres Arenas Chavarria
% Daniel Cadena Marin
% Cristian Camilo Rendon Cardona
%==========================================================================

%% Limpiando espacio de trabajo
clear all
close all
clc

%% Definiendo variables
global E_
global A_
global I_
global x_
global y_
global z_
global CERCHA
global PORTICO
global Des
global Fuer
global Fuerzas_elementos
global Fuerzas_L
global N
global E
global esfuerzo
global L
global ang
global tipo_estructura


%% posiciones en la matriz de elementos
E_ = 6;
I_ = 5;
A_ = 4;
%% No son posiciones en una matriz, son los numeros que se le asignaran a los ejes cartesianos
x_ = 1;
y_ = 2;
z_ = 3;

%% portico o cercha
PORTICO = 1;
CERCHA = 2;


%% Se tiene el nombre de los archivos
Nodos = 'matrices/nodes.txt';
Elementos = 'matrices/elements.txt';
Frontera = 'matrices/boundary_conditions.txt';
Fuerzas = 'matrices/forces.txt';

%% Tipo de estructura y factor de multiplicacion
tipo_estructura = menu('Select structure type','Frame','Truss');
%Fescalar = str2double(inputdlg('Enter the sacling factor to plot the displacements','Scaling factor'));

[N,E,B,F] = gen_matrices(Nodos,Elementos,Frontera,Fuerzas); %La funci�n lee los archivos y guarda las matrices


%% calculando la mtriz de rigidez global del elemento
[K_global,k,ind,ang,L] = Matriz_global(N,E,tipo_estructura);

%% Desplazamientos conocidos y desconocidos
[uc,ud] = variables_conocidas(B,size(K_global,1),tipo_estructura);

%% Fuerzas conocidas y desconocidas
[fc,fd] = fuerzas_conocidas(ud,F,size(K_global,1),tipo_estructura);

%% solucionar y encontrar los vectores de fuerzas y desplaxzamientos
[Desplazamiento,Fuerza] = solucionar_sis(uc,ud,fc,K_global);

%% Matrices de condiciones de frontera y fuerzas rellenadas por completo
[Des,Fuer] = matrices_sol(Desplazamiento,Fuerza,tipo_estructura);

%% Se solucionan las fuerzas para cada elemento a partir de los desplazamientos nodales
[Fuerzas_elementos] = sol_fuerzas_elementos(k,ind,Des);

%% Hallar las fuerzas en el sistema de coordenadas local de cada elemento 
for i = 1:size(E,1)
    Fuerzas_L{i} = fuerzas_locales(Fuerzas_elementos{i},ang(i),tipo_estructura);
end


%% Obteniendo esfuezos axiales y cortantes
for i = 1 : size(E,1)
    [esfuerzo(i,1),esfuerzo(i,2),esfuerzo(i,3)] = esfuerzos(Fuerzas_L{i},E(i,A_),E(i,I_),tipo_estructura);
end

Analisis_resultados