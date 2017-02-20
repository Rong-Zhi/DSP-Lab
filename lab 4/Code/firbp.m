function h = firbp(N,w1,w2)
w1=w1/pi;
w2=w2/pi;
if mod(N,2)~=0
    n=(-(N-1)/2):((N-1)/2); 
    h=w2*sinc(w2*n)-w1*sinc(w1*n);
else
    n=(-N/2):N/2;
    h=w2*sinc(w2*n)-w1*sinc(w1*n);
end
end
