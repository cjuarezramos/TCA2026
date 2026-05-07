% Critero de Nyquist
syms s
Fs = (s+1)/(s-1);

A = -2 + 2j;
B = 2 + 2j;
C = 2 + 1j;
D = -2 + 1j;

N = 100;
% Tramo A a B
sig = linspace(real(A),real(B),N);
w = linspace(imag(A),imag(B),N);
sc = sig +1i*w
y = double(subs(Fs,s,sc))
figure(1)
hold
plot([real(A),real(B)],[imag(A),imag(B)])
hold 
figure(2)
hold
plot(real(y),imag(y))
hold

% Tramo B a C
sig = linspace(real(B),real(C),N);
w = linspace(imag(B),imag(C),N);
sc = sig +1i*w
y = double(subs(Fs,s,sc))
figure(1)
hold
plot([real(B),real(C)],[imag(B),imag(C)])
hold 
figure(2)
hold
plot(real(y),imag(y))
hold

% Tramo C a D
sig = linspace(real(C),real(D),N);
w = linspace(imag(C),imag(D),N);
sc = sig +1i*w
y = double(subs(Fs,s,sc))
figure(1)
hold
plot([real(C),real(D)],[imag(C),imag(D)])
hold 
figure(2)
hold
plot(real(y),imag(y))
hold

% Tramo D a A
sig = linspace(real(D),real(A),N);
w = linspace(imag(D),imag(A),N);
sc = sig +1i*w
y = double(subs(Fs,s,sc))
figure(1)
hold
plot([real(D),real(A)],[imag(D),imag(A)])
hold 
figure(2)
hold
plot(real(y),imag(y))
hold


% Ejemplos de NYQUIST
T1 = 5;
T2 = 1;
K = 10;
G = tf(K,conv([T1,1],[T2,1]))
nyquist(G)
T = feedback(G,1)
step(T)


% Ejemplos de NYQUIST 2
T1 = 2;
T2 = 3;
K = 0.1;
G = tf(K,conv([1,0],conv([T1,1],[T2,1])))
nyquist(G)
T = feedback(G,1)
step(T)

% ejemplo nyquist 3
K = 0.1
G = tf(2*[1,3],[1,-1,0])
nyquist(G)
T = feedback(G,1)
step(T)


% ejemplo 4 de nyquist
K = 1
T1 = 2
T2 = 1
G = tf(K*[T1,1],[T2,1,0,0])
nyquist(G)
T = feedback(G,1)
step(T)


% ejemplo 4 de nyquist
K = 1
T1 = 2
T2 = 1
G = tf(K*[T2,1],[T1,1,0])
nyquist(G)
T = feedback(G,1)
step(T)

% margenes de fase y ganancia
K = 40;
G = tf(K,conv([1,0],conv([1,1],[1,5])))
figure(1)
hold on
nyquist(G)
hold off
figure(2)
T = feedback(G,1);
hold on
step(T)
hold off
figure
margin(G)