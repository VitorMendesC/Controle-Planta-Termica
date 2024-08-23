close all
clc

input = input(1:30000);

t0 = 0;
t1 = 300;
dt = t1/length(input);
t_inp = t0:dt:t1;
t_inp(end) = [];

Kc = 9.89;
dc = 45;

K = 0.527091;
tau = 33.1396;
theta = 29.0535;
Tamb = 30.2731;

num = K;
den = [tau  1];
G =tf(num,  den) ;
num_delay = [theta^2/12 -theta/2 1];
den_delay = [theta^2/12 theta/2 1];
P= tf(num_delay,den_delay);
G_delay = dc*G*P + Tamb;

[Y, T] = step(G_delay, 300);

figure
hold on
plot(T, Y);
plot(t_inp, Kc * input);
hold off
xlabel('Tempo [s]');
ylabel('Temperatura [C]');
title('Resposta degrau da planta, e aproximação')
legend('Aproximaçâo','Planta real')
ylim([0 60])