% ejemplo 1
G0 = tf(25,[1,4,25])
figure
bode(G0)
figure
nyquist(G0)



G1 = tf(9*[1,0.2,1],conv([1,0],[1,1.2,9]))
figure
bode(G1)
figure
nyquist(G1)

G2 = tf([1],[1,1,0,0])
figure
bode(G2)
figure
nyquist(G2)