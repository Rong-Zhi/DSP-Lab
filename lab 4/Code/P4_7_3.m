clear;
clc;
N=53;
wp=0.12*pi;
ws=0.18*pi;
wc=(ws+wp)/2;
w=ws-wp;
A=30;
win=kwin(w,A);
N1=length(win);
h1=firlp(N1,wc).*win;
[Hw,ww]=freqz(h1);

figure(1);
subplot(2,1,1);
n=0:N-1;
stem(n,h1,'r');

xlabel('n');
ylabel('h(n)');
hold on;

alpha=(N-1)/2;
Hmag=[ones(1,4),zeros(1,23)];
wk=2*pi/N*(0:alpha);
Hphi=exp(-1i*wk*alpha);
H=Hmag.*Hphi;
H=[H,conj(H(end:-1:2))];
H1=H(1:alpha+1);
h=ifft(H);
n=0:N-1;
stem(n,h);
legend('window method','frequency sampling method');
subplot(2,1,2);
plot(ww,abs(Hw),'r');
hold on;
[h,w]=freqz(h);
plot(w,abs(h));
legend('window method','frequency sampling method');
w1=2*pi/N*(0:alpha);
stem(w1,abs(H1));
ylim([0 1.5]);


