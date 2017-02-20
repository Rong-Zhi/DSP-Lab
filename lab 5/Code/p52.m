clear;
clc;
close all;
Rp=1;
Rs=25;
fs=200;
Wp=32/(fs/2);
Ws=38/(fs/2);
[Nb,Wb]=buttord(Wp,Ws,Rp,Rs)
[Bb,Ab]=butter(Nb,Wb);
Hb=tf(Bb,Ab,1/fs);
figure
zplane(Bb,Ab);
title('pole-zero diagram of butterworth');
figure
freqz(Bb,Ab);
[hb,wb]=freqs(Bb,Ab);
title('frequency response of butterworth');   
figure
impz(Bb,Ab);
title('impulse response of butterworth');
[Nc,Wc]=cheb1ord(Wp,Ws,Rp,Rs);
[Bc,Ac]=cheby1(Nc,Rp,Wc);
Hc=tf(Bc,Ac,1/fs);
figure
zplane(Bc,Ac);
title('pole-zero diagram of chebyshev');
figure
freqz(Bc,Ac);
title('frequency response of chebyshev');
figure
impz(Bc,Ac);
title('impulse response of chebyshev');
[Ne,We]=ellipord(Wp,Ws,Rp,Rs);
[Be,Ae]=ellip(Ne,Rp,Rs,We);
He=tf(Be,Ae,1/fs);
figure
zplane(Be,Ae);
title('pole-zero diagram of elliptic');
figure
freqz(Be,Ae);
title('frequency response of elliptic');
figure
impz(Be,Ae);
title('impulse response of elliptic');
dev = [(10^(Rp/20)-1)/(10^(Rp/20)+1)  10^(-Rs/20)];
[Nf,Ff,Af,Wf]=firpmord([32 38],[1 0],dev,200);
b=firpm(Nf,Ff,Af,Wf);
figure
freqz(b);
title('frequency response of Parks-McClellan optimal equiripple FIR filter');


