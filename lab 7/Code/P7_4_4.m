clear;
close all;
clc;
[y1,t1]=readfile('Wang.txt');
for n=1:2000
    if t1(n)<=10
    y(n)=y1(n+616);
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
[pkss,locs]=findpeaks(y2,'minpeakheight',1);
for m=1:2
    tmp=locs(m);
    x(m)=t(tmp);
    pks(m)=pkss(m);
end
plot(t,y,'r',t,y2,'b');
hold on;
text(x+.02,pks,'R','Color','green');
annotation('doublearrow',[.16 .22],[.33 .33],'Color','green');
plot([x(1),x(1)],[-2,3],'g',[x(2),x(2)],[-2,3],'g'); 
xlabel('time/seconds');
ylabel('milivolt');
legend('orginal','after butterworth low-pass filter');

length=length(y2);
nfft=1024;
figure;
subplot(2,1,1);
periodogram(y2,[],nfft);
L=6;
len=length/L;
pxx1=pwelch(y2,len,0,nfft);
subplot(2,1,2);
x=0:1/513:(1-1/513);
plot(x,10*log10(pxx1));
xlabel('Radians/sample');
ylabel('dB');
title('Averaged Periodogram with L=6');
grid on;
[M,I]=max(10*log10(pxx1));
beat=x(I)*100/(4)*60