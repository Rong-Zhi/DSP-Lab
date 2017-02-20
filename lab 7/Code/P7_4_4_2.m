clear;
close all;
clc;
[y1,t1]=readfile('resp_fast.txt');
for n=1:996
    if t1(n)<=10
    y(n)=y1(n);
    t(n)=t1(n);
    end
end
N=length(t);
y1=detrend(y);
[b,a] = butter(30,0.8);%sampling frequency f0=100Hz,cutoff frequency fc=40Hz, which is 0.8pi 
y2=filter(b,a,y1);
figure;
subplot(2,1,1);
plot(t,y,'r',t,y1,'b');
xlabel('time/seconds');
ylabel('milivolt');
legend('orginal','removed the mean and linear trend');
subplot(2,1,2);
plot(t,y,'r',t,y2,'b');
xlabel('time/seconds');
ylabel('milivolt');
legend('orginal','after butterworth low-pass filter');

len1=length(y2);
figure;
nfft=1024;
subplot(2,1,1);
periodogram(y2,[],nfft);
L=6;
len2=len1/L;
pxx1=pwelch(y2,len2,0,nfft);
pxx1=pxx1';
len3=length(pxx1);
subplot(2,1,2);
x=0:1/len3:(1-1/len3);
plot(x,10*log10(pxx1));
xlabel('Radians/sample');
ylabel('dB');
title('Averaged Periodogram with L=6');
grid on;
[M,I]=max(10*log10(pxx1));
brefast=x(I)*100/4*60