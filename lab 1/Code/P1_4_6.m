clear;
close all;
n=0:100;
F=1;T=0.05;
s=sin(2*pi*F*n*T);
% figure(1);
% plot(n,s);
% figure(2)
% plot(n*T,s);
% figure(3);
% stem(n,s);
S=fft(s,128);
P=S.*conj(S);
w=(0:127)/128;
% figure(4);
% plot(2*w,P);%%Frequency in rad/sample
% title('Frequency in rad/sample');
figure(5)
plot(w/T,P);%Frequency in Hz
title('Frequency in Hz,Compared s with s2');
hold on;
s2=s+sin(2*pi*4*n*T);
S2=fft(s2,128);
P2=S2.*conj(S2);
w2=(0:127)/128;
plot(w2/T,P2,'g');
b=[1 1 1 1]/4;a=1;
[H,w1]=freqz(b,a);
figure(6);
plot(w1/(2*pi*T),abs(H));%magnitude vs frequency in Hz
title('magnitude vs frequency in Hz');
sf=filter(b,a,s2);
figure(7);
plot(n,s,'g');
hold on;
plot(n,sf);
figure(8);
Sf=fft(sf,128);
Pf=Sf.*conj(Sf);
wf=(0:127)/128;
plot(wf/T,Pf);