clear;
load('ar7.mat');
X=X';
N=length(X);
M=2;
Cxx1=spec2(X,M);
w=0:2*pi/N:pi;
figure;
subplot(2,1,1);
plot(w,Cxx1);
title('m=2');
M=10;
Cxx2=spec2(X,M);
subplot(2,1,2);
plot(w,Cxx2);
title('m=10');


