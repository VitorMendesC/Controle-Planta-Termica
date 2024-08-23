close all
clc

input = input(1:20000);

t0 = 0;
t1 = 200;
dt = t1/length(input);
t = t0:dt:t1;
t(end) = [];

Kc = 9.89;
SV = 50;

figure
plot(t, Kc * input, 'r')
line([t0 t1], [SV SV])
xlabel('Tempo [s]')
ylabel('Temperatura [C]')
title('Controlador PID - com autotunagem')
legend('Resposta','Set Value')
ylim([0 80])