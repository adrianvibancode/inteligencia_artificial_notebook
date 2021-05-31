clc
clear vars;

% patrones de entrenamiento
P1=[1,-1,-1,-1,1,-1,1,-1,1,-1,-1,-1,1,-1,-1,-1,1,-1,1,-1,1,-1,-1,-1,1]; %patron de X
P2=[1,1,1,1,1,1,-1,-1,-1,1,1,-1,-1,-1,1,1,-1,-1,-1,1,1,1,1,1,1];%patron de O
P3=[1,-1,-1,-1,-1,1,-1,-1,-1,-1,1,-1,-1,-1,-1,1,-1,-1,-1,-1,1,1,1,1,1,];%patron de L
P4=[1,1,1,1,1,-1,-1,-1,1,-1,-1,-1,1,-1,-1,-1,1,-1,-1,-1,1,1,1,1,1];%patron de Z
PW=[1,-1,-1,-1,1,1,-1,-1,-1,1,1,-1,1,-1,1,-1,1,-1,1,-1,-1,1,-1,1,-1]; % W

%---- patrones de busqueda ----

%P5=[-1,-1,-1,-1,-1,-1,1,-1,1,-1,-1,-1,-1,-1,-1,-1,1,-1,1,-1,1,-1,-1,-1,1]; %casi X
P5=[1,1,-1,-1,1,-1,1,-1,-1,1,-1,1,1,-1,-1,-1,1,-1,-1,1,1,-1,-1,-1,1]; %casi X
P6=[1,1,1,-1,1,-1,-1,1,-1,1,1,-1,-1,-1,-1,1,-1,-1,-1,1,-1,1,-1,1,1]; %casi o
%P6=[-1,1,1,1,1,1,-1,-1,-1,1,1,-1,-1,-1,1,1,-1,-1,-1,1,1,1,1,1,-1];%casi O
P7=[-1,-1,-1,-1,-1,1,-1,-1,-1,-1,1,-1,-1,-1,-1,1,-1,-1,-1,-1,1,-1,-1,1,1];%casi Lvideo
%P7=[1,-1,-1,-1,-1,-1,-1,-1,-1,-1,1,-1,1,-1,-1,1,-1,-1,-1,-1,1,1,1,1,1];%casi L
P8=[1,1,1,1,1,-1,-1,-1,1,-1,-1,-1,-1,-1,-1,-1,1,-1,-1,-1,1,1,1,1,-1];%casi Z
%Pwe=[1,-1,-1,-1,1,1,-1,-1,-1,1,1,-1,-1,-1,1,-1,1,-1,1,-1,-1,1,1,1,-1]; %casi W
Pwe=[1,1,-1,-1,1,1,-1,-1,-1,1,1,-1,1,-1,1,-1,-1,-1,1,-1,-1,1,-1,1,-1]; % W


P9=Pwe; % para las pruebas de funcionamiento...al cambiar P6 por cualquier patron, semiautomatizamos el proceso

%---- definir la matriz de PESOS -----
T=(P1' * P1-eye(25)) + (P2' * P2-eye(25)) +(P3' * P3-eye(25)) + (P4' * P4-eye(25)) + (PW' * PW-eye(25));

salir = 0; %contador para salir del while cuando exista igualdad entre vector busqueda y respuesta

a=P9; % iniciamos proceso...asignando el patron de busqueda a U(a)

b1 = a * T;

for i=1:25
    if b1(i) > 0
        b1(i) = 1;
    else
        b1(i)=-1;
    end
end

cont=0;

while (salir==0)
    a = b1;
    b2 = a * T;
    for i=1:25
        if b2(i) > 0
            b2(i) = 1;
        elseif b2(i) < 0
            b2(i) = -1;
        end
    end
    
    salir = isequal(b2,b1); % revisa que los patrones sean igualees y regresa un 1
    
    if (salir==0)
        b1=b2;
    end
    cont = cont + 1;
    
    %{
    IT2 = b2;
    for i=1:25
        if IT2(i) == -1
            IT2(i)=0;
        end
    end
    
    for i=1:5
        S(1,i)=IT2(i);
        S(2,i)=IT2(i+5);
        S(3,i)=IT2(i+10);
        S(4,i)=IT2(i+15);
        S(5,i)=IT2(i+20);
    end
    S
    %}
     
    
end


%% proceso para imprimir las salidas del sistema en forma matricial
IT2 = b2;
PAT=P9;
for i=1:25
    if IT2(i)==-1
        IT2(i)=0;
    end
    if PAT(i)==-1
        PAT(i)=0;
    end
end

for i=1:5
    P(1,i)=PAT(i);
    P(2,i)=PAT(i+5);
    P(3,i)=PAT(i+10);
    P(4,i)=PAT(i+15);
    P(5,i)=PAT(i+20);
    
    S(1,i)=IT2(i);
    S(2,i)=IT2(i+5);
    S(3,i)=IT2(i+10);
    S(4,i)=IT2(i+15);
    S(5,i)=IT2(i+20);
end
%% Impresi?n de las saliadas del sistema
cont
fprintf('El patron ingresado es:\n');
P
fprintf('El patron es igual a:\n');
S

    