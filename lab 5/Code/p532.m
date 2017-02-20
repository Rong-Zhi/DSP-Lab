Ne=10;
[Be,Ae]=ellip(Ne,3,40,[0.36 0.52],'stop');
He=tf(Be,Ae,1/fs);
figure
zplane(Be,Ae);
title('pole-zero diagram of elliptic');
figure
freqz(Be,Ae);
title('frequency response of elliptic');
n=0:200;
x=sin(0.44*pi*n);
figure
subplot(2,1,1);
plot(x);
title('before');
y=filter(Be,Ae,x);
subplot(2,1,2)
plot(y);
title('after');