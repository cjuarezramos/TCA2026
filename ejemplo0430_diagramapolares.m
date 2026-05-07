T = 1
G = tf(1,[T,1])
nyquist(G)

Z = .0;
wn = 10;
G2 = tf(wn^2,[1,2*Z*wn,wn^2])
nyquist(G2)