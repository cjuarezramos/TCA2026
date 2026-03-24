
G = tf (10,[1,1,0])
% dado que H = 1, FTLA = G
rlocus(G)
sgrid()

syms s
polo_deseado = -1.5 + 2.5981i;
g = 10/(s*(s+1))
g_polo_deseado = subs(g,s,polo_deseado)
angle_g_pd= angle(g_polo_deseado)
angle_g_pd = double(angle_g_pd)
angle_g_pd = angle_g_pd*180/pi
deficiencia_angulo = 180 - angle_g_pd   