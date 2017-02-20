n=1:10;
y=log(n)-0.2*n;
plot(n,y);
y2=sin(n/2);
hold on
plot(n,y2,'g:*')
hold off
xlabel('n')
ylabel('y')
legend('curve 1','cureve 2')