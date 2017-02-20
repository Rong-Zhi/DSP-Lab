function Cxx=spec1(X,L,win)
N=length(X);
Cxx=0;
M=N/L;
for m=1:300
    Cxx(m)=0;
for l=1:L
    sum(l,m)=0;
    winsum=0;
    for n=1:M
        Xl(l,n)=X(n+(l-1)*M);
        winsum=winsum+abs(win(n)).^2;
        sum(l,m)=sum(l,m)+win(n)*Xl(l,n)*exp(-1i*2*pi*m/300*n);
    end
    Ixx(l,m)=1/winsum*abs(sum(l,m)).^2;
    Cxx(m)=Cxx(m)+Ixx(l,m)/L; 
end
end
end

        

