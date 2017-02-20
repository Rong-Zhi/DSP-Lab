function h = firlp(N,wc)
wc=wc/pi;
if mod(N,2)~=0
    n=(-(N-1)/2):((N-1)/2); 
    h=wc*sinc(wc*n);
else
    n=(-N/2):N/2;
    for m=1:N
    if n(m)~=0
    h(m)=wc*sinc(wc*n(m));
    end
    end
end
end



