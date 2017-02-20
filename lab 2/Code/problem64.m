clear;
clear all;
load('b3pulses.mat');
fs = 80000;
f1 = 5000;
f2 = 8000;
f3 = 10500;
f4 = 15500;
f5 = 18000;
f6 = 20000;

w1_delta = 2*pi*(f2-f1)/fs;
w1 = 2*pi*(f2+f1)/(2*fs);
w2_delta = 2*pi*(f4-f3)/fs;
w2 = 2*pi*(f4+f3)/(2*fs);
w3_delta = 2*pi*(f6-f5)/fs;
w3 = 2*pi*(f5+f6)/(2*fs);

syms r;
r1 = double(solve(2*(1-r)/sqrt(r)-w1_delta));
r2 = double(solve(2*(1-r)/sqrt(r)-w2_delta));
r3 = double(solve(2*(1-r)/sqrt(r)-w3_delta));

b = [1 0 -1];
a1 = [1 -2*r1*cos(w1) r1^2];
a2 = [1 -2*r2*cos(w2) r2^2];
a3 = [1 -2*r3*cos(w3) r3^2];

[H1, W1] = freqz(b,a1);
[H2, W2] = freqz(b,a2);
[H3, W3] = freqz(b,a3);

plot(W1/pi, 20*log10(abs(H1)),W2/pi,20*log10(abs(H2)),'r--',W3/pi,20*log10(abs(H3)));
xlabel('\omega/\pi');
ylabel('|H(e^j^\omega)^2| in dB');
legend('freq range 5~8kHz','freq range 10.5~15.5kHz','freq range 18~20kHz');
title('Frequency response of the bandpass filter');

h1 = filter(b,a1,x);
h2 = filter(b,a2,x);
h3 = filter(b,a3,x);

figure
subplot(2,2,1);
plot(x);
xlabel('n');
ylabel('Input noisy signal x(n)');
subplot(2,2,2);
plot(h1);
xlabel('n');
ylabel('Filtered signal x(n), range 5kHz-8kHz');
subplot(2,2,3);
plot(1:length(h2),h2);
xlabel('n');
ylabel('Filtered signal x(n), range 10.5kHz-15.5kHz');
subplot(2,2,4);
plot(1:length(h3),h3);
xlabel('n');
ylabel('Filtered signal x(n), range 18kHz-20kHz');

 
FFT_x = fft(x);
FFT_x1 = fft(h1);
FFT_x2 = fft(h2);
FFT_x3 = fft(h3);
figure
plot(1:length(FFT_x),abs(FFT_x)/max(abs(FFT_x)));
hold on
plot(1:length(FFT_x1),abs(FFT_x1)/max(abs(FFT_x1)),'r--');
hold on
plot(1:length(FFT_x2),abs(FFT_x2)/max(abs(FFT_x2)),'g-.');
hold on
plot(1:length(FFT_x3),abs(FFT_x3)/max(abs(FFT_x3)),'k:');
















