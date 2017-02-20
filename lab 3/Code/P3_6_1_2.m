for k=1:5
    N=2.^(k+3);
    n=0:N-1;
    x=0.8*sin(0.2*pi*n);
    tic;
    y=DFT(x,N);
    rd(k)=toc;
    N=length(y);
    w=2*pi*(0:1/N:1-1/N);
    subplot(5,2,1+2*(k-1));
    stem(w,abs(y));
    title('Calculate DFT by DFT function');
    xlabel('\omega');
    ylabel('|X(e^{jw})|');
    tic;
    Xk=fft(x);
    rf(k)=toc;
    N=length(Xk);
    wk=2*pi*(0:1/N:1-1/N);
    subplot(5,2,2*k);
    stem(wk,abs(Xk));
    title('Calculate DFT by FFT');
    xlabel('\omega');
    ylabel('|X(e^{jw})|');
end
rd
rf