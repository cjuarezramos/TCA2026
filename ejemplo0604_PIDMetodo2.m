% ejemplo Metodo2 Ziegler-Nichols
G = tf(1,conv([1,0],conv([1,1],[1,5])))
rlocus(G)
Kcr = 30;
Pcr = 2.8099;

Kp = 18;
Ti = 1.405;
Td = 0.3512;
Gc = Kp*tf([Td,1,1/Ti],[1,0])

T = feedback(G*Gc,1);
step(T)
polos1 = pole(T)
zeros1 = zero(T)

% sobre enlogación muy alta, vale la pena mover k
Gc2 = tf(conv([1,1.4],[1,1.4]),[1,0])
rlocus(G*Gc2)

% propuesta 1, aumentar magnitud de los ceros

Gc2 = tf(conv([1,4],[1,4]),[1,0])
rlocus(G*Gc2)
% propuesta 2 disminuir ceros entre polos en origen y primer polo real
Gc2 = tf(conv([1,0.8],[1,0.8]),[1,0])
rlocus(G*Gc2)

K = 16.3
M = feedback(Gc2*G*K,1)
zero(M)
pole(M)

Kpnuevo = 10;
Gc2= Kpnuevo*tf([Td,1,1/Ti],[1,0])
T2 = feedback(Gc2*G,1)
hold on
step(T2)
hold off
Td = 0.3512
Ti = 1.405
Zeros_compensador = [-1/2/Td + sqrt(1/4/Td^2-1/Td/Ti);
    -1/2/Td - sqrt(1/4/Td^2-1/Td/Ti)]