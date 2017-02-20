u=[0:pi/60:2*pi];
v=[0:pi/60:pi];
[U,V]=meshgrid(u,v);
R=3;
X=R*sin(V).*cos(U);
Y=R*sin(V).*sin(U);
Z=R*cos(V);
mesh(X,Y,Z);
axis equal;