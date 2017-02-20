clear;
clc;
x=open('mynumber.mat');
xx=x.xx;
p=1;
for i=1:11
    key(i)=dtmfcoef(xx(p:(p+255)));
    p=p+320;
end
key
