% N=12;
N=36;
rec=window(@rectwin,N);
bar=window(@bartlett,N);
ham=window(@hamming,N);
wr=dtft(rec,16,N);
wb=dtft(bar,16,N);
wh=dtft(ham,16,N);
figure
M=16*N;
w1=(0:1/M:1-1/M);
subplot(3,1,1);
plot(w1,20*log10(abs(wr)),'r');
title('N=36,DTFT of rectangular window.');
subplot(3,1,2);
plot(w1,20*log10(abs(wb)),'b');
title('DTFT of bartlett window.');
subplot(3,1,3);
plot(w1,20*log10(abs(wh)),'g');
title('DTFT of hamming window.');
wvtool(wr,wb,wh);
% w1 = window(@bartlett,N); 
% w2 = window(@hamming,N); 
% wvtool(w,w1,w2)