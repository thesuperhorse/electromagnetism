%[V, Ex, Ey] = coaxial_box(a, b, c, d, x0, y0, V0)
%inputs
a = 20;
b = 15;
c = 5;
d = 3;
x0 = 5;
y0 = 5;
V0 = 5;
%defines
Nx = 101;
Ny = 101;
%Initial constants
hx = a/Nx;
hy = b/Ny;
row1 = floor(Nx*x0/a)+1;
row2 = floor(Nx*(x0+c)/a)+1;
column1 = floor(Ny*y0/b)+1;
column2 = floor(Ny*(y0+d)/b)+1;
%Initial set up of nodes
Vold = zeros(Nx, Ny);
Vold(row1:row2,column1:column2) = V0;
%first approx to set Vnew
[Vnew] = approx(Vold);
%iterative averaging
maxdev=max(max(abs(100*(Vnew-Vold)./(Vnew))))
[Vnew] = approx(Vold);
maxdev=max(max(abs(100*(Vnew-Vold)./(Vnew))))
[Vnew] = approx(Vold);
maxdev=max(max(abs(100*(Vnew-Vold)./(Vnew))))

