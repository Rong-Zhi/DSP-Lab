clear;
close all;
n=-10:20;
x1=sin(0.12*pi*n);
figure
subplot(6,1,1);
stem(n,x1);
title('x1');
u1=+(n>=0);
u2=+(n>=6);
x2=u1-u2;
subplot(6,1,2);
stem(n,x2);
title('x2');
x3=(0.9.^n).*u1;
subplot(6,1,3);
stem(n,x3);
title('x3');
delta1=+(n==1);
delta2=+(n==2);
delta3=+(n==3);
x4=0.5*delta1+delta2+0.5*delta3;
subplot(6,1,4);
stem(n,x4);
title('x4');
x5=(0.9.^n).*cos(0.2*pi*n);
subplot(6,1,5);
stem(n,x5);
title('x5');
x6=sinc(0.2*pi*n);
subplot(6,1,6);
stem(n,x6);
title('x6');