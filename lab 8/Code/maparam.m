function b= maparam(x,order)
cxx=xcorr(x,order);
% var=cxx(2*order+1)/0.15;
r=roots(cxx);
N=length(r);

for n=1:N
    if abs(r(n))<=1
        Ro(n)=r(n);     
    end
end
p=poly(Ro);
M=length(p);
for n=1:M
    if p(n)~=0;
        Po(n)=p(n);
    end
end
b=Po;
end

