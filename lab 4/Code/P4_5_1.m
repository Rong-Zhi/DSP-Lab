clear;
N=14;
f=[0 0.42 0.58 1];
a=[1 1 0 0];
h=firpm(N-1,f,a);
n=0:N;


freqz(h);