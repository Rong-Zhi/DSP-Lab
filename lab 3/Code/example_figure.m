clear all;
close all;

set(0,'DefaultAxesFontSize',16)

t=0:0.01:1;

x1=sin(2*pi*t);

figure
plot(t,x1)
grid on;
box off;

xlabel('t')
ylabel('sin(2\pit)')

print -depsc FIGURE_NAME
