clear;
clc;
load('s5.mat');
n=1;
for m=15600:16300
    SH(n)=s5(m);
    n=n+1;
end
n=1;
for m=16800:17500
    AA(n)=s5(m);
    n=n+1;
end
a1=aryule(SH,10);% Yule-Walker -SH
[Pa1,F1]=freqz(1,a1);
plot(F1/pi,20*log10(abs(Pa1)));
hold on;
xlabel('Normalized Frequency')
ylabel('PSD (dB/Hz)')
title('SH')

L=8;
len=(length(SH)+3)/L;
overlap=0.5*len;
[Pxx1,F11]=pwelch(SH,len,overlap);%windowed averaged periodogram
plot(F11/pi,10*log10(abs(Pxx1)),'r');
legend('PSD of Yule-Walker Estimation','PSD of Windowed averaged periodogram');

figure;
a2=aryule(AA,10);% Yule-Walker - AA
[Pa2,F2]=freqz(1,a2);
plot(F2/pi,20*log10(abs(Pa2)));
hold on;
xlabel('Normalized Frequency')
ylabel('PSD (dB/Hz)')
title('AA')
L=8;
len=(length(AA)+3)/L;
overlap=0.5*len;
[Pxx2,F22]=pwelch(AA,len,overlap);%windowed averaged periodogram
plot(F22/pi,10*log10(abs(Pxx2)),'r');
legend('PSD of Yule-Walker Estimation','PSD of Windowed averaged periodogram');

X=SH;
N=length(X);
for m=1:10
    a=aryule(X,m);
    var(m)=0;
    sum=0;
    for n=m:N
        s=0;
        for k=1:m
            s=s+a(k)*X(N-k);
        end
        sum=sum+(X(n)+s).^2;
        var(m)=var(m)+sum/(N-m);
    end
AIC(m)=log(var(m))+2*m/N;
end
figure;
plot(AIC);
[M1,I1]=min(AIC)
a3=aryule(SH,I1);% Yule-Walker -SH
[Pa3,F3]=freqz(1,a3);
plot(F3/pi,20*log10(abs(Pa3)),'b',F1/pi,20*log10(abs(Pa1)),'r');
hold on;
xlabel('Normalized Frequency')
ylabel('PSD (dB/Hz)')
legend('order 4','order 10');
title('SH')

X=AA;
N=length(X);
for m=1:10
    a=aryule(X,m);
    var(m)=0;
    sum=0;
    for n=m:N
        s=0;
        for k=1:m
            s=s+a(k)*X(N-k);
        end
        sum=sum+(X(n)+s).^2;
        var(m)=var(m)+sum/(N-m);
    end
AIC(m)=log(var(m))+2*m/N;
end
figure;
plot(AIC);
[M2,I2]=min(AIC)
a4=aryule(AA,I2);% Yule-Walker -SH
[Pa4,F4]=freqz(1,a4);
plot(F4/pi,20*log10(abs(Pa4)),'b',F2/pi,20*log10(abs(Pa2)),'r');
hold on;
xlabel('Normalized Frequency')
ylabel('PSD (dB/Hz)')
legend('order 4','order 10');
title('AA')






