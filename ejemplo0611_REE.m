% Representación en espacio de estados.
R = 1;
L = 3;
Cap = 0.1;
A = [-R/L,-1/L;
    1/Cap, 0];
B = [1/L;
    0];
C = [0 1;
    1 0;
    R 0;
    -R -1];
D = [0;0;0;1];
i0 = 0;
vc0 = 5;
sys = ss(A,B,C,D) % creando un sistema en represetancio de estacio de estados.
[y,t] = step(sys) % respuesta al escalon del sistema.

% Voltaje del capacitor
plot(t,y(:,1))
title('Tensión del capacitor')

% Corriente del sistema RLC
plot(t,y(:,2))
title('Corriente de malla')

% Voltaje del resistor
plot(t,y(:,3))
title('Tensión de la resistencia')
xlabel('Tiempo (s)')


% Voltaje del inductor
plot(t,y(:,4))
title('Tensión del inductor')
xlabel('Tiempo (s)')