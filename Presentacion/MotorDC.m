% Autor: Carlos Juarez
% Fecha: 10 de marzo de 2026
% Descripción: Controladores

% Parámetros del sistema
R = 2.27; % Resistencia (Ohm)
L = 0.0047; % Inductancia (H)
Ka = 0.25;   % Constante de ganancia del amplificador (V/rad/s)
Km = 0.25;   % Constante de ganancia del motor (V/rad/s)
J = 0.00246; % Inercia del rotor (kg*m^2)
B = 0.003026; % Coeficiente de fricción viscosa (N*m*s/rad)

Ass = [-R/L,-Ka/L;Km/J,-B/J];
Bss=[1/L;1/J*0];
Css = [0 1];
Dss = 0;
sys_ee = ss(Ass,Bss,Css,Dss);
step(sys_ee)

num = [Km/(J*L)];
den = [1,B/J+R/L,B*R/J/L+Km*Ka/J/L];

sys_ft = tf(num,den)
figure
step(sys_ft)

% sintonización del proporcional
rlocus(sys_ft)
sgrid

% Integral
Kp = 7.7
Ti = 0.1
Gc = tf([Kp*Ti,1],[Ti,0])
Gt = Gc*sys_ft
rlocus(Gt)
sgrid
