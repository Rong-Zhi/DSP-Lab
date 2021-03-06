N=32;
n=0:N-1;
x=0.8*sin(0.2*pi*n);
y=DFT(x,N);
N=length(y);
w=2*pi*(0:1/N:1-1/N);
subplot(2,1,1);
stem(w,abs(y));
title('Calculate DFT by DFT function');
xlabel('\omega');
ylabel('|X(e^{jw})|');
Xk=fft(x);
N=length(Xk);
wk=2*pi*(0:1/N:1-1/N);
subplot(2,1,2);
stem(wk,abs(Xk));
title('Calculate DFT by FFT');
xlabel('\omega');
ylabel('|X(e^{jw})|');