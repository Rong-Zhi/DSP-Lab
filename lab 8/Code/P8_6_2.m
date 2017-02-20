clear;
clc;
load('ma3.mat');
A=[1 0.4 -0.2 0.15];
order=3;
figure;
[H,F]=freqz(A,1,[],1);
plot(F,20*log10(abs(H)),'b');
hold on;
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')
b=maparam(x,order);
[Ma,F]=freqz(b,1,[],1);
plot(F,20*log10(Ma),'r');
legend('True Power Spectral Density','Moving average Process PSD Estimate');

