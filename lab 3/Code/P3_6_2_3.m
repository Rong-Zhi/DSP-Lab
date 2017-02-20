clear;
% N=12;
N=36;
n=0:N-1;
x=0.8*sin(0.2*pi*n);
% rec=window(@rectwin,N);
% bar=window(@bartlett,N);
% ham=window(@hamming,N);

r=rectwin(N);
b=bartlett(N);
h=hamming(N);
s1=x'.*r;
s2=x'.*b;
s3=x'.*h;
wr=dtft(s1,16,N);
wb=dtft(s2,16,N);
wh=dtft(s3,16,N);
% figure
% M=16*N;
% w1=(0:1/M:1-1/M);
% plot(w1,20*log10(abs(wr)),'r');
wvtool(wr,wb,wh);
