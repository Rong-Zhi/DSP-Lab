function y=convmat(x,h)



n=size(x);
H=convmtx(h,n);
y=H*x;
end

