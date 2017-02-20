v=-1:0.1:1;
for t=1:21
    if v(t)>0
       s(t)=1;
    elseif v(t)<0
            s(t)=-1;
        else s(t)=0;
    end 
end
sign(v)
s