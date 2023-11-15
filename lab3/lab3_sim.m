clear;
clc;
close all;
format long;
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
D1 = c2d(C1, 1/f);

%% Lab 3
s = tf('s');
K2 = 0.0609;
K3 = -4.419;
% C2 = -7 * (s+0.35)/(s+2.5);
% D2 = c2d(C2, 1/f);
ccs_des = (s+3)*(s+2)*(s-(-0.62+1i))*(s-(-0.62-1i));
[coefs] = tfdata(ccs_des, 'v');
C2 = 1/(K2*K3) * (coefs(3)*s^2 + coefs(4)*s + coefs(5)) / (coefs(1)*s^2 + coefs(2)*s);
P2 = K2*K3/(s^2);
T = feedback(P2*C2, 1);
stepinfo(T)