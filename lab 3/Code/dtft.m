function y=dtft(x,n,N)
%
%   
    M=n*N;
    w=2*pi*(0:1/M:1-1/M);
    y=fft(x,M);


end

