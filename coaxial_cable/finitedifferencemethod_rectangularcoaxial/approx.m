function [Vnew] = approx(Vold)
%iterative averaging of the nodes
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

% add with a weight factor
Vnew = 0.25*(Vup + Vdown + Vleft + Vright);
end