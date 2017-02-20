clear;
clc;
close all;
load('arunknown.mat');
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
MDL(m)=log(var(m))+m*log(N)/N;
end
plot(AIC);
hold on;
plot(MDL,'-r');
legend('AIC','MDL');
[M1,I1]=min(AIC)
[M2,I2]=min(MDL)



