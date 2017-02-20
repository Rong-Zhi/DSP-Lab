function h = firhp(N,wc)
wc=wc/pi;
if mod(N,2)~=0
    n=(-(N-1)/2):((N-1)/2); 
    delta=+(n==0);
    h=delta-wc*sinc(wc*n);
else
    n=(-N/2):N/2;
    delta=+(n==0);
        h=delta-wc*sinc(wc*n);
end
end
