clear;
N=64;
z=wgn(1,N,-3);
m=mean(z);
v=var(z);
for n=1:N
    x(n)=sin(0.2*pi*n)+2*sin(0.4*pi*n)+sin(0.45*pi*n)+z(n);
end
nfft=256;
figure;
subplot(2,1,1);
periodogram(x,[],nfft);
title('Periodogram Power Spectral Density Estimate with N=64');

N=256;
z=wgn(1,N,-3);
for n=1:N
    x(n)=sin(0.2*pi*n)+2*sin(0.4*pi*n)+sin(0.45*pi*n)+z(n);
end
subplot(2,1,2);
periodogram(x,[],nfft);
title('Periodogram Power Spectral Density Estimate with N=256');
L=2;
length1=N/L;
pxx1=pwelch(x,length1,0,nfft);
figure;
subplot(2,1,1);
plot(10*log10(pxx1));
xlabel('Radians/sample');
ylabel('dB');
grid on;
title('Averaged Periodogram with L=2, without zero-padding.');
L=4;
length2=N/L;
pxx2=pwelch(x,length2,0,nfft);
subplot(2,1,2);
plot(10*log10(pxx2));
xlabel('Radians/sample');
ylabel('dB');
grid on;
title('Averaged Periodogram with L=4, without zero-padding.');
figure;
subplot(2,1,1);
pxx3=pwelch(x,length1,0,nfft*2);
plot(10*log10(pxx3));
xlabel('Radians/sample');
ylabel('dB');
grid on;
title('Averaged Periodogram with L=2, with 256 zeros.');
subplot(2,1,2);
pxx4=pwelch(x,length2,0,nfft*2);
plot(10*log10(pxx4));
xlabel('Radians/sample');
ylabel('dB');
grid on;
title('Averaged Periodogram with L=4, with 256 zeros.');




