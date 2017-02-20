G=[0.6 1.5 2.3 -0.5;8.2 0.5 -0.1 -2.0;5.7 8.2 9.0 1.5;0.5 0.5 2.4 0.5;1.2 -2.3 -4.5 0.5];
size(G)
for m=1:5
    for n=1:4
        if G(m,n)==0.5;
            fprintf('G(%d,%d)=0.5\n',m,n);
        else
            if sign(G(m,n))==-1;
                fprintf('G(%d,%d) is negative\n',m,n);
            else
            end
        end
    end
end