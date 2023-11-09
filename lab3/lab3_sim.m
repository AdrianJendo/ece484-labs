%% Lab 1
K1 = -2.054;
tau = 0.0222;
%% Lab 2
r = -16;
i = 9;
g1 = 1;
g0 = abs(2*r);
k = tau/K1 * (r^2 + i^2);
s = tf('s');
P = K1 / (s*(tau*s+1));
C1 = k * (s + 1/tau) / (g1 * s + g0);
T = feedback(P*C1, 1);
% stepinfo(T)
bw = bandwidth(T);
f = 1000;
D = c2d(C1, 1/f);
[NUM,DEN]=tfdata(D,'v');
K2 = 0.0609;
K3 = -4.419;


%% Lab 3
