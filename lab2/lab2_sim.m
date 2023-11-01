k1 = -2.054;
tau = 0.0222;

r = -16;
i = 9;

g1 = 1;
g0 = abs(2*r);
k = tau/k1 * (r^2 + i^2); % try j = 10, 12, 18

s = tf('s');

P = k1 / (s*(tau*s+1));
C = k * (s + 1/tau) / (g1 * s + g0);

T = feedback(P*C, 1);
stepinfo(T)

bw = bandwidth(T);

%% b
f = 1000;
D = c2d(C, 1/f);

%% c
[NUM,DEN]=tfdata(D,'v');

