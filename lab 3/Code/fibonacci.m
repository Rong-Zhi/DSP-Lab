  function f=fibonacci(n)
  % FIBONACCI(n) generates the first n numbers of the fibonacci sequence. 
  f(1)=1;
  f(2)=1;
  for i=3:n
    f(i)=f(i-1)+f(i-2);
  end
  end