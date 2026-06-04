% ejemplo que pasa si meto polos y ceros en lazo abierto.
% Polos en lazo abierto.
z = 1;
wn = 1;
%g = wn^2/(s*(s+2*z*wn))
%gc = 1/(1+Tp*s)
% valores de Tp
vTp=[0 0.5 1 2 5];
figure;
hold on;
for i=1:length(vTp)
    Tp=vTp(i);
    M=tf([wn^2],[Tp (1+2*z*wn*Tp) 2*z*wn wn^2]);
    [x,t]=step(M,20);
    plot(t,x)
end
ylim([0 2])
grid on
title('Efecto de un polo en FT Directa')
ylabel('y(t)')
xlabel('Tiempo s')
 
text(0.6,0.6,'Tp = 0')
text(2.2,0.9,'Tp = 0.5')
text(3.5,1.1,'Tp = 1')
text(6,1.35,'Tp = 2')
text(10,1.6,'Tp = 5')





% CASO 2 UN CERO EN LA FUNCIÓN DE TRANSFERENCIA DE LAZO CERRADO
% g(s) = wn^2/(s*(s+2*z*wn))
% gc(s) = (1+Tz*s)
wn=1; z=1;
% valores de Tp
vTz=[0 1 3 6 10];
for i=1:length(vTz)
    Tz=vTz(i);
    M=tf([wn^2*Tz wn^2],[1 2*z*wn wn^2]); %Lazo cerrado
   [x,t]=step(M,15);
    X{i}=x;
    T{i}=t;
end
figure; hold on;
plot(T{1},X{1},'b')
plot(T{2},X{2},'r')
plot(T{3},X{3},'y')
plot(T{4},X{4},'m')
plot(T{5},X{5},'k')
grid on; ylim([0 6])
title('Efecto de un cero en FT Lazo Cerrado')
ylabel('y(t)'); xlabel('Tiempo s')
legend('Tz=0','Tz=1','Tz=3','Tz=6','Tz=10')
