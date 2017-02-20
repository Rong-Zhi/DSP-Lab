function y=DFT(x,N)
%N=length(x);

for m=1:N
    for n=1:N
    Ma(m,n)=exp(-(1i*2*(pi/N)*m*n));

    end
end
y=Ma*x';
end

