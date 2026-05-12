% % Compensador en adelanto
% Kc = 1;
% alfa = 0.1;
% T = 1;
% 
% Gc = Kc*alfa*tf([T,1],[alfa*T,1])
% 
% bode(Gc)
% nyquist(Gc)

% Ejemplo
G = tf(4,[1,2,0])
margin(G)

% paso 1: cumplir con constante de errrr
K=10;
G1=K*G;
figure(1)
bode(G)
hold on
margin(G1)
hold off
% Paso2: Angulo del companesador
phi = 37; % 32 para llegar a 50 y 5 grados más por modificacion de frecuancia de cruce de ganancia
% paso3: Calcular alfa
alfa = (1-sind(phi))/(1+sind(phi))

% paso 4. wm
magGcawm = 20*log10(1/sqrt(alfa))

wc = 8.84;
% paso 5
sz = sqrt(alfa)*wc
sp = wc/sqrt(alfa)
Gc1 = tf([1,sz],[1,sp])
Kc = K/alfa;
Gc = Kc*Gc1
figure
margin(G*Gc)
