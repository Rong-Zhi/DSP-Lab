clear;
clf;
close all;
x=rand(1000,1);
max(x)
min(x)
r=mean(x)
s=std(x)
y=4*x-2;
m=mean(y)
n=std(y)
fprintf('4*%f-2=%f',r,m);
clear;
x=randn(1000,1);
hist(x)
