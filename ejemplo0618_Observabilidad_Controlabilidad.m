R = 100;
L = 3;
C = 0.1;
%% Funcion de transferencia
G = tf([C,0],[L*C,R*C,1])
pole(G)
%% Representación A
A1 = [0,1;-(1/(L*C)),-R/L]
B1 =[0;1/(L*C)]
C1 = [0,C]
D1 = [0]
sys1 = ss(A1,B1,C1,D1)
% Autovalores
[V1,D_lambda1] = eig(A1)
% Autovector izquierdo
W1 = inv(V1)
% Factores de participación
P1 = V1.*W1

% Controlabilidad
Co = ctrb(A1,B1)
rank_Co = rank(Co)
Ob = obsv(A1,C1)
rank_Ob = rank(Ob)

%% Representación B
A2 = [-R/L, -1/L; 1/C, 0]
B2  = [1/L ; 0]
C2 = [1, 0]
D2 = [0]
sys2 = ss(A2,B2,C2,D2)

%% Comparación de respuesta al escalón
[y1,t1] = step(sys1);
[y2,t2] = step(sys2);
plot(t1,y1,'-r',t2,y2,'.b')
[V2,D_lambda2]=eig(A2)
W2 = inv(V2)

