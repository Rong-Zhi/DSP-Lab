%impluse invariance method
clear;
clear all;
clc;
close all;
N=4;
wc=0.3*pi;
Td=2;
% Td=10;
omegac=wc/Td;

k=0:N-1;
sk=omegac*exp(1i*pi*(2*k+N+1)/(2*N));
p=poly(sk);
Hc=tf(omegac.^N,p);
[bz,az]=impinvar(omegac.^N,p,1/Td);
bz=real(bz);
az=real(az);
figure(1);
impulse(Hc);
h=impulse(Hc);
figure(2);
Hz=tf(bz,az,Td)
impulse(Hz);
figure(3)
freqz(bz,az);
grid on;
figure(4)
freqs(omegac.^N,p);
figure(5);
[b,a]=butter(N,omegac/pi);
freqz(b,a);



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



