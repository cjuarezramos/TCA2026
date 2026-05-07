T = 1;
T1 = 0.5;

G1 = tf([T,1],[T1,1])
G2 = tf([-T,1],[T1,1])
w = 0.01:0.01:100;
[magG1,phaG1,w1]=bode(G1,w);
[magG2,phaG2,w2] = bode(G2,w);

figure(1)
semilogx(w1,20*log10(magG1(:)),'.r')
hold
semilogx(w2,20*log10(magG2(:)),'-b')
hold


figure(2)
semilogx(w1,phaG1(:),'.r')
hold
semilogx(w2,phaG2(:)-360,'-b')
hold


figure(3)
step(G1)
hold
step(G2)
hold

% Turbina hidraulica
KD = 0;
Tw = 2;
Tm = 10;
R = 0.746
Ggenerador = tf(1,[Tm,KD]);
Gturbina = tf([-Tw,1],[Tw/2,1])
K = 1/R;

% Funcion de tranferencia de trayectoria directa
G = K*Gturbina*Ggenerador;
% Lazo cerrado

T = feedback(G,1)
step(T)


% Retraso de tiempo
G = tf(1,1,'InputDelay',0.1);
bode(G)
step(G)