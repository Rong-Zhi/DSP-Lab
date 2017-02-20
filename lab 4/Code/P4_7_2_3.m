%highpass filter
wc=0.15*pi;
N=51;
h=firhp(N,wc);
n=1:N;
figure(1);
subplot(2,1,1);
stem(n,h);
xlabel('n');
ylabel('h(n)');
title('Impluse Response of Highpass filter');
[H,w]=freqz(h);
subplot(2,1,2);
plot(w/pi,20*log10(abs(H)));
xlabel('Normalized Frequency(\times\pi rad/sample)');
ylabel('Magnitude (dB)');
title('Frequency Response of Highpass filter');




%bandpass filter
w1=0.25*pi;
w2=w1+0.3*pi;
N=51;
h=firbp(N,w1,w2);
n=1:N;
figure(2);
subplot(2,1,1);
stem(n,h);
xlabel('n');
ylabel('h(n)');
title('Impluse Response of Bandpass Filter');
[H,w]=freqz(h);
subplot(2,1,2);
plot(w/pi,20*log10(abs(H)));
xlabel('Normalized Frequency(\times\pi rad/sample)');
ylabel('Magnitude (dB)');
title('Frequency Response of Bandpass Filter');
