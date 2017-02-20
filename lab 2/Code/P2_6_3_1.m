n=-10:20;
b=[0.16 0.48 0.48 0.16];
a=[1 0.13 0.52 0.3];
delta=+(n==0);
h=filter(b,a,delta);
figure
subplot(2,1,1);
stem(n,h);
[H,w]=freqz(b,a);
subplot(2,1,2);
plot(w/pi,20*log10(abs(H)));