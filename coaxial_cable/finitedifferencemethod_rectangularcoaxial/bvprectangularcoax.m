function [V,Ex,Ey,C,We,We2,gridpointsx,gridpointsy,innerx,innery,outerx,outery,contx,conty]= bvprectangularcoax(a,b,c,d,xo,yo,er,Vo,contour)
% This function used the finite difference method to solve the
% two-dimensional electrostatic boundary value problem related to a square
% coaxial cable.
% a = width of outer conductor
% b = height of outer conductor
% c = width of inner conductor
% d = height of inner conductor
% xo = the x-coordinate of the location of the bottom left corner of the inner conductor
% yo = the y-coordinate of the location of the bottom left corner of the inner conductor
% er = the relative permittivity of the dielectric which fills the space
% between the inner and outer conductor
% Vo = electric potential of the inner conductor (outer is grounded)
% contour = ofset for the contour integral

% Define the fundamental constant eo
eo=8.854e-12;

% Set number of nodes and node spacings
Nx=201;
hx=a/(Nx-1);
hy=hx;
Ny=round(b/hy+1);

%inside box
innerstartx = round(xo/hx+1);
innerendx = round(innerstartx+c/hx);
innerstarty = round(yo/hy+1);
innerendy = round(innerstarty+d/hy);

%Setup the grid
[gridpointsx,gridpointsy,innerx,innery,outerx,outery,contx,conty] = fdrectcoaxplotnodes(a,b,c,d,xo,yo,Nx,Ny,contour);

% Set the initial values of V to zero
V = zeros(Nx,Ny);

% Set the known potential values (or boundary values)
% Vbound = 0;
% V(1,1:Ny)=Vbound; % Grounded left side
% V(1:Nx,1)=Vbound; % Grounded bottom side
% V(Nx,1:Ny)=Vbound; % Grounded right side
% V(1:Nx,Ny)=Vbound; % Grounded top side

%Boundary values
Vboundary_zero = zeros(Nx, Ny);
Vboundary_zero(2:Nx-1, 2:Ny-1) = 1;

%set inner box potential
V(innerstartx:innerendx,innerstarty:innerendy) = Vo;

%Looping
maxdev = 100;
while maxdev >= 1e-4
    Vold = V;
    [V] = approx(Vold);
    V(innerstartx:innerendx,innerstarty:innerendy) = Vo;
    V = V .* Vboundary_zero; %set boundary
    maxdev = max(max(abs(100*(V-Vold)./(V))));
end
%Electric Field
[Ey,Ex]=gradient(-V,hx,hy);

%finding capacitance

%summing up interior and exterior voltages
%top
V_ic(1) = sum(sum(V(innerstartx-contour,innerstarty-contour:innerendy+contour)));
V_oc(1) = sum(sum(V(innerstartx-contour-1,innerstarty-contour:innerendy+contour)));
%bottom
V_ic(2) = sum(sum(V(innerendx+contour,innerstarty-contour:innerendy+contour)));
V_oc(2) = sum(sum(V(innerendx+contour+1,innerstarty-contour:innerendy+contour)));
%left
V_ic(3) = sum(sum(V(innerstartx-contour:innerendx+contour,innerstarty-contour)));
V_oc(3) = sum(sum(V(innerstartx-contour:innerendx+contour,innerstarty-contour-1)));
%right
V_ic(4) = sum(sum(V(innerstartx-contour:innerendx+contour,innerendy+contour)));
V_oc(4) = sum(sum(V(innerstartx-contour:innerendx+contour,innerendy+contour+1)));
%sum of Efield
%Q/L = er*eo*[(V_ic - V_oc)/hx]*hy   +(flip x and y)
%assuming hx = hy
% C = Q/Vo
%(C/L) = (1/Vo)*(Q/L)
C = er*eo*sum(V_ic-V_oc)/Vo;
We = 0.5 * C * Vo^2;
We2 = 0.5 * er * eo * hx * hy * sum(sum(Ex.^2+Ey.^2));
end