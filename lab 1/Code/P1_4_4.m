clear;
r=[0.5:0.01:10];
for m=1:951
   h(m)=330/(pi*(r(m)^2));
end
A=2*pi*(r.^2)+2*pi*r.*h;
a=find(A==min(A));
r(a)
h(a)
figure(1);
plot(r,A,'g');grid on;
hold on;
plot(r(a),min(A),'r:*');
text(r(a),min(A)+100,'minimum');
fprintf('%f,%f',r(a),h(a));
figure(2);
u=[0:pi/60:2*pi];
v=[0:0.1:h(a)];
[U,V]=meshgrid(u,v);
X=r(a)*cos(U);
Y=r(a)*sin(U);
Z=V;
mesh(X,Y,Z);
axis equal;
