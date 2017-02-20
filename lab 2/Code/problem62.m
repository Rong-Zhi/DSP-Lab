clc;
clear all;
%1. signal generator
fs = 8192;
f1 = 392;
n = 0:1/fs:1;
x1 = sin(2*pi*f1*n);
%soundsc(x1);

%2. Adding 7 harmonics
x2 = x1;
for k = 2:8
   x2 = x2 + 0.25.^(k-1)*sin(2*pi*k*f1*n);
end
%soundsc(x2);

%3. Generate an envelop A(n)
An = envelope(length(x2),0.25,[240,7200]);
x3 = An.*x2;
plot(x3);
xlabel('x');
ylabel('A(n)');
title('Modulated signal');
figure
soundsc(x3);
Y = fft(x3);
plot(1:length(Y), abs(Y)/max(abs(Y)));
hold on;

%4 Load pianoG3.mat
load('pianoG3.mat');
%soundsc(g);
FFT_g = fft(g);
plot(1:length(FFT_g),abs(FFT_g)/max(abs(FFT_g)),'r--');
xlabel('frequency Hz')
ylabel('|H(e^j^\omega)^2/|');
legend('generated signal','piano signal');
hold off;
