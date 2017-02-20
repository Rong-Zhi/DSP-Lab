clear;
clc;
close all;
n=0:0.001:0.3;
x=5*sin(200*pi*n)+2*cos(300*pi*n);
figure
plot(x);
fs=1000;
Ws=100/(fs/2);
Wp=150/(fs/2);
Rp=1;
Rs=40;
[N,wn]=cheb2ord(Wp,Ws,Rp,Rs);
[B,A]=cheby2(N,Rs,wn,'high');
H=tf(B,A,1/fs);
y=filter(B,A,x);
figure
plot(y)
