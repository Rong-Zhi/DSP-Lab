clear;
clc;
x_noise=open('noise_5insx.mat');
x_n=x_noise.x_5insx;
x_speech=open('speech.mat');
x_s=x_speech.x_speech;
% soundsc(x_n);
% soundsc(x_s);
fs=8192;
x_n3=x_n*0.5;
xsum=x_n3+x_s;
% soundsc(xsum);
f_s=fft(x_s);
f_n=fft(x_n);
fsum=fft(xsum);
figure(1);
N=length(f_s);
w=2*(0:1/N:1-1/N);
plot(w,abs(f_s));
title('Frequency components');
hold on;
plot(w,abs(f_n),'r');
legend('speech signal','noise signal');
% W=length(f_s);
W=101;
h=firbp(W,0.06*pi,0.53*pi).*bartlett(W)';
xf=filter(h,1,xsum);
ff=fft(xf);
figure(2);
subplot(2,1,1);
plot(w,abs(fsum));
title('Noised signal');
subplot(2,1,2);
plot(w,abs(ff));
title('Filtered signal');
soundsc(xf);




