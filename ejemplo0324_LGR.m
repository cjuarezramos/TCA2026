% Lugar de las raíces
% Fecha: 24 de marzo de 2026
% 
% Servo
% datos de planta:
J = 0.00625;
B = 0.02;

% construccion de FTLA
K = 1;
G = tf(K,[J,B,0]);
% G es la funcion de transferencia de lazo abierto pq H = 1

rlocus(G)


K = 0.04;
FTLA = K*G;
FTLC = feedback(FTLA,1)

step(FTLC)