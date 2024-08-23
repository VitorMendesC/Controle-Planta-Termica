close all
clc

t0 = 0;
t1 = 500;
dt = 500/length(input);
t = t0:dt:t1;
t(end) = [];

Kc = 9.89;

figure
plot(t, Kc * input, 'r')
line([t0 t1], [60 60])
xlabel('Tempo [s]')
ylabel('Temperatura [C]')
title('Controlador PID - sem autotunagem - Kp = 3; Ki = 0,05')
legend('Resposta','Set Value')
ylim([0 100])