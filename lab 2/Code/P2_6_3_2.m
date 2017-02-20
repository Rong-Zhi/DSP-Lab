clear;
k=0:100;
n=0:255
wk=pi*k./100;
b=[0.16 0.48 0.48 0.16];
a=[1 0.13 0.52 0.3];
for p=1:101
x=cos((pi*p/100)*n);
y(p,:)=filter(b,a,x);
y(p,1:30)=0;
end
[H,w]=freqz(b,a);
H1=max(y',[],1);
plot(wk/pi,20*log10(H1),'r:*');
hold on 
plot(w/pi,20*log10(abs(H)),'g');
legend('measurement results','frequency response');



