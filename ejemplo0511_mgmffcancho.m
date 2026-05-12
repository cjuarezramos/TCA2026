K = 20;
G = tf(K,conv([1,0],conv([1,1],[1,5])))
figure(1)
margin(G)
figure(2)
T = feedback(G,1);
hold on
bode(T)
hold off
figure(3)
hold on
step(T)
hold off
t = 0:0.01:30;
[y,t]=lsim(T,t,t);
figure(4)
hold on
plot(t,t,t,y)
stepinfo(T)