N=72;
P=16;
n=0:N-1;
a=0.75;
w0=0.2*pi;
w=w0+2*pi*a/N;
%for a=0:0.1:1
x=cos(w0*n)+cos(w*n);
r=rectwin(N);
h=hamming(N);
sr=r.*x';
sh=h.*x';
wr=dtft(sr,P,N);
wh=dtft(sh,P,N);
figure
M=P*N;
w=(0:1/M:1-1/M);
subplot(2,1,1);
plot(w,abs(wr),'g');
xlabel('Nomalized frequency');
ylabel('|H(e^{jw})|');
title('Using rectangular window.');
subplot(2,1,2);
plot(w,abs(wh),'b');
xlabel('Nomalized frequency');
ylabel('|H(e^{jw})|');
title('Using hamming window.');



