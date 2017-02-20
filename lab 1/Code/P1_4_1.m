clear;
M=magic(5)
sum(M)
sum(M')
M(1,:)
M(:,3)
M(2:end,1:3)
for m=1:5
    for n=1:5
        if M(m,n)>10;
            fprintf('M(%d,%d)>10\t',m,n);
        else
        end
    end
end
 fprintf('\n');
for m=1:5
    for n=1:5
        if M(m,n)<4;
            fprintf('M(%d,%d)<4\t',m,n);
        else
        end
    end
end