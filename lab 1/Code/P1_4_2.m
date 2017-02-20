clear;
fibonacci(12)
for n=2:12
    f=fibonacci(n);
    r(n)=f(n)/f(n-1);
end
plot(r,'g:*');
t=0:0.01:12;
a=((5)^0.5+1)/2;
hold on;
plot(t,a,'b');
legend('fibonacci','¦Õ=(5^0.5+1)/2');
