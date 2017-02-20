clear;
clc;
z=randn(1024,1);
A=[1 0.5 0.7 0.2];
x=filter(1,A,z);
figure;
[H,F]=freqz(1,A,[],1);%true spectrum
plot(F,20*log10(abs(H)),'b');
hold on;
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')
a=aryule(x,3);%Yule-Walker
[Pa,F]=freqz(1,a,[],1);
plot(F,20*log10(abs(Pa)),'r');
[Px,F]=pyulear(x,3,1024,1);%pyulear
plot(F,10*log10(abs(Px)),'g');
legend('True Power Spectral Density','aryule PSD Estimate','pyulear PSD Estimate')