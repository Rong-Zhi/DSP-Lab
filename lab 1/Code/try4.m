A=2;
phi=pi/6;
omega=2*pi/12;
n=-10:10;
x=A*sin(omega*n+phi);
stem(n,x,'fill');
grid on;


