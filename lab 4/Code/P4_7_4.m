clear;
% N=10;
N=25;
% N=50;
f=[0 0.1 0.2 0.3 0.4 0.5 0.6 0.8 0.9 1];
a=[0 0 1 1 0 0 0.5 0.5 0 0];
b=firpm(N-1,f,a);
[h,w]=freqz(b,1,512);
plot(f,a,w/pi,abs(h),'r')
legend('Ideal','firpm Design')
xlabel 'Radian Frequency (\omega/\pi)', ylabel 'Magnitude'

ylim([0 1.5]);