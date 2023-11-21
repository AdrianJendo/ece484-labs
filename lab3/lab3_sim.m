clear;
clc;
close all;
format long;
%% Lab 1
K1 = -2.054;
tau = 0.0222;
%% Lab 2
r = -16;
img = 9;
g1 = 1;
g0 = abs(2*r);
k = tau/K1 * (r^2 + img^2);
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
re = -1;
cpx = 1;
%ccs_des = (s+1)*(s+1)*(s-(re+cpx*1i))*(s-(re-cpx*1i));
%ccs_des = (s+0.3)*(s+0.4)*(s-(re+cpx*1i))*(s-(re-cpx*1i));
%%ccs_des = (s-(-1.033+1.254*1i))*(s-(-1.033-1.254*1i))*(s-(-0.3167-0.06619*1i))*(s-(-0.3167+0.06619*1i));
ccs_des = (s-(-0.5+1i))*(s-(-0.5-1i))*(s+3)*(s+4);
[coefs] = tfdata(ccs_des, 'v');

g2 = coefs(1);
g1 = coefs(2);
f0 = coefs(5)/(K2*K3);
g0 = K2*K3*f0 / 24;
f2 = (coefs(3)-g0) / (K2*K3);
f1 = coefs(4) / (K2*K3);

% C2 = 1/(K2*K3) * (coefs(3)*s^2 + coefs(4)*s + coefs(5)) / (coefs(1)*s^2 + coefs(2)*s);
C2 = (f2*s^2 + f1*s + f0) / (g2*s^2 + g1*s + g0);
P2 = K2*K3/(s^2);
T = feedback(P2*C2, 1);
stepinfo(T)
D2 = c2d(C2, 1/f);