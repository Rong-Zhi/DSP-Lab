 %bilinear method
clear;
clear all;
clc;
close all;
N=4;
wc=0.3*pi;
Td=1
% Td=2;
omegac2=tan(wc/2)*2/Td;
k2=0:N-1;
sk=omegac2*exp(1i*pi*(2*k2+N+1)/(2*N));
p2=poly(sk);
figure
Hc=tf(omegac2.^N,p2);
impulse(Hc);

figure
freqs(omegac2.^N,p2);

figure
[numd dend]=bilinear(omegac2.^N,p2,1/Td)
numd=real(numd)
dend=real(dend)
freqz(numd,dend);

figure
Hz2=tf(numd,dend,Td);
impulse(Hz2)


figure
[b2,a2]=butter(N,omegac2/pi);
freqz(b2,a2);






