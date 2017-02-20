clear;
clc;
close all;
p=0:4;
t=+(p>=0&p<=4);
h=0.2*t;
n=0:9;
x1=+(n>=0&n<=9);
% stem(n,x1);


m=0:35;
x2=sin(0.2*pi*m);
x3=sin(0.4*pi*m);
y1=convmat(x1,h);
y2=convmat(x2,h);
y3=convmat(x3,h);
p=[p,5:13];
m=[m,36:39];
y11=conv(x1,h);
y22=conv(x2,h);
y33=conv(x3,h);
figure
subplot(3,2,1);
stem(p,y1);
title('x1 by convmat');
subplot(3,2,3);
stem(m,y2);
title('x2 by convmat');
subplot(3,2,5);
stem(m,y3);
title('x3 by convmat');
subplot(3,2,2);
stem(p,y11);
title('x1 by conv');
subplot(3,2,4);
stem(m,y22);
title('x2 by conv');
subplot(3,2,6);
stem(m,y33);
title('x3 by conv');