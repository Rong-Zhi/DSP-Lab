clear;
clc;
N=17;
M=51;
h1=firlp(N,0.5*pi);
hh=h1.*hamming(N)';
hr=h1.*rectwin(N)';
hb=h1.*bartlett(N)';
figure(1);
[hh,wh]=freqz(hh);
[hr,wr]=freqz(hr);
[hb,wb]=freqz(hb);
plot(wr/pi,20*log10(abs(hr)),'r',wb/pi,20*log10(abs(hb)),'g',wh/pi,20*log10(abs(hh)),'b');
legend('Rectangular Window','Bartlett Window','Hamming Window');
xlabel('Normalized Frequency(\times\pi rad/sample)');
ylabel('Magnitude (dB)');
title('N=17');

h2=firlp(M,0.5*pi);
hhh=h2.*hamming(M)';
hrr=h2.*rectwin(M)';
hbb=h2.*bartlett(M)';
figure(2);
[hhh,whh]=freqz(hhh);
[hrr,wrr]=freqz(hrr);
[hbb,wbb]=freqz(hbb);
plot(wrr/pi,20*log10(abs(hrr)),'r',wbb/pi,20*log10(abs(hbb)),'g',whh/pi,20*log10(abs(hhh)),'b');
legend('Rectangular Window','Bartlett Window','Hamming Window');
xlabel('Normalized Frequency(\times\pi rad/sample)');
ylabel('Magnitude (dB)');
title('N=51');