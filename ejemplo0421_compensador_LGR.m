% EJEMPLO LUGAR DE LAS RAICES

gM =tf([2],[1,2,2,0])
rlocus(gM)
 a = 0.489

 G = tf(2*[1,a],[1,2,0,0])

 T = feedback(G,1)

 polos = roots(T.Denominator{1})

 