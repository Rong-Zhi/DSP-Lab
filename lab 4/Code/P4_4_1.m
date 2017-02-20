clear;
clc;
N=19;
alpha=(N-1)/2;
Hmag=[zeros(1,4),ones(1,2),zeros(1,4)];
wk=2*pi/N*(0:alpha);
Hphi=exp(-1i*wk*alpha);
H=Hmag.*Hphi;
H=[H,conj(H(end:-1:2))];
h=ifft(H);
figure
subplot(2,1,1);
n=0:N-1;
stem(n,h);
subplot(2,1,2);
% P=length(H);
w=2*pi*(0:1/N:1-1/N);
plot(abs(H));
ylim([0 1.5]);

