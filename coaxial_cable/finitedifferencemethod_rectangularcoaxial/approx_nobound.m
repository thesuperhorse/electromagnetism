function [Vnew] = approx_nobound(Vold)
[R,C] = size(Vold);
%initialize shifted matrices
Vup = zeros(R,C);
Vdown = zeros(R,C);
Vleft = zeros(R,C);
Vright = zeros(R,C);

%shift all
Vup(1:R-1, :)   = Vold(2:R, :);
Vdown(2:R, :)   = Vold(1:R-1, :);
Vleft(:, 1:C-1) = Vold(:, 2:C); 
Vright(:, 2:C)  = Vold(:, 1:C-1);

%for inside boundary
%add with a weight factor
Vnew = (0.25)*(Vup + Vdown + Vleft + Vright);

%4 edges
Vnew(1:R,1) = (4.0/3.0)*Vnew(1:R,1); %left
Vnew(1:R,C) = (4.0/3.0)*Vnew(1:R,C);%right
Vnew(1,1:C) = (4.0/3.0)*Vnew(1,1:C); %top
Vnew(R,1:C) = (4.0/3.0)*Vnew(R,1:C);%bottom

%4 corners
%Vnew(1,1) = (1.5)*Vnew(1,1);
%Vnew(1,C) = (1.5)*Vnew(1,C);
%Vnew(R,1) = (1.5)*Vnew(R,1);
%Vnew(R,C) = (1.5)*Vnew(R,C);

end