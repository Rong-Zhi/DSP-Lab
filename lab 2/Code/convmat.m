function y=convmat(x,h)
n=length(x);
m=length(h);
x=x';
h=h';
H=zeros(m+n-1,n);
for c=1:n
    H(c:(c+m-1),c)=h;
end
y=H*x;
end

