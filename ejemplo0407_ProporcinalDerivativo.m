% Ejemplo con PD

% Sistemas
G = tf(1,1000*[1,0,-1.1772])

% requerimientos
Z = 0.7;
wn = 0.5;
polos_deseados = roots([1,2*Z*wn,wn^2])

% bastará solo con Kp
rlocus(G)

% Deficit de angulo
pd = polos_deseados(1)

syms s
g = 1/(1000*(s^2-1.1772))
angle_g = double(angle(subs(g,s,pd)))*180/pi
deficit_angulo = 180 - angle_g

phi = deficit_angulo

Td = tand(phi)/(imag(pd)-tand(phi)*real(pd))

gc = 1+Td*s
double(angle(subs(gc,s,pd)))*180/pi

GLA = tf([Td,1],1000*[1,0,-1.1772])
rlocus(GLA)

Kp = 1427.24
FTLC = feedback(Kp*GLA,1)
step(FTLC)