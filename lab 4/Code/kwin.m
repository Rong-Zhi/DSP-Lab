function w= kwin(w,A)
 N=ceil((A-8)/(2.285*w)+1);
 if A<21
     beta=0;
 elseif (A>=21)&&(A<50)
     beta=0.5842*(A-21).^0.4+0.07866*(A-21);
 elseif A >= 50
     beta=0.1102*(A-8.7);
 end
  n=0:1:N-1;
     w=besseli(0,beta*(1-(2*n/(N-1)-1).^2).^0.5)/besseli(0,beta);
end

