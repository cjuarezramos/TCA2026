% Compensador en atraso
% Requerimientos 
% Kv = 5; MF = 40; MG > 10dB
G = tf(1,conv([1,0],conv([1,1],[0.5,1])))
margin(G)
% Paso 1. Elijo K para cumplir con Kv
K = 5
% genero nueva G1
G1= K*G
% Nuevos margenes de fase y ganancia
figure(1)
bode(G)
hold on
margin(G1)
hold off
legend('G','G1')
% Paso 2, desde la gráfica buscar w que si cumpla con MF

% paso 3. Ubicar frecuencia esquina (si se puede una decada por debajo de
% frecuencia de cruce de ganancia)
valor_atenuar = 16.2
% paso 4. Calcular la ganacia que se debe atenuar y calcular B
B = 10^(valor_atenuar/20)

% paso 5. calcular otra frecuencia esquina


% paso 6. Calcular Kc

Kc = 0.7744;
sz = 0.063
sp = sz/B
Gc = Kc * tf([1,sz],[1,sp])

figure(1)
bode(G)
hold on
bode(Gc)
margin(G*Gc)


T = feedback(G*Gc,1)
figure
step(T)
To = feedback(G,1)
hold on
step(To)
