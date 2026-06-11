% Symbolico para resolver
syms Ms ms ls ths pths bs cs xs pxs Fs Ts Is gs

E = [Ms+ms  ms*ls*cos(ths); ...
    ms*ls*cos(ths) ms*ls^2+Is]
f = [-bs*pxs-ms*ls*pths^2*sin(ths)+Fs;
    -cs*pths+ms*ls*gs*sin(ths)+Ts]

p2x = det([f,E(:,2)])/det(E)
p2th = det([E(:,1),f])/det(E)