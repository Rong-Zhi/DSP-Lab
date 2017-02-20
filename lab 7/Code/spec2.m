function Cxx=spec2(X,M)
N=length(X);
for k=1:N/2+1
    Cxx(k)=0; 
    for m=-M:M
        sum(k)=0;
        Ixx(k)=0;
        for n=1:N    
            if (k+m-1)<0||(k+m-1)>N/2
               sum(k)=sum(k);
            else
               sum(k)=sum(k)+X(n)*exp(-1i*2*pi*(k+m)/N*n);  
            end
        end
        Ixx(k)=1/N*abs(sum(k)).^2;
        Cxx(k)=Cxx(k)+1/(2*M+1)*Ixx(k);
    end
end
end


