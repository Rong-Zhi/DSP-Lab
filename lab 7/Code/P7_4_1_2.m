clear;
load('ar7.mat');
L=5;
N=length(X);
M=N/L;
X=X';
Cxx=spec1(X,L,rectwin(M));
x=2*pi/300:2*pi/300:2*pi;
figure;
subplot(2,1,1);
plot(x,Cxx);
title('Rectangular window');
subplot(2,1,2);
Cxx1=spec1(X,L,hamming(M));
plot(x,Cxx1,'-g');
title('Hamming window');
n=norminv([0.025 0.975],0,1);
log1=10*log10(Cxx1)-10*log(n(1)/(L).^0.5);
log2=10*log10(Cxx1)+10*log(n(2)/(L).^0.5);
figure;
plot(x,10*log10(Cxx1));
hold on;
plot(x,log1,'r');
plot(x,log2,'g');
title('Log-spectrum with L=5 and a Hamming window.');
legend('Cxx','upper bound','lower bound');
ylabel('dB');



