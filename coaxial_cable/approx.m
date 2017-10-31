function [Vnew] = approx(Vold)
%iterative averaging of the nodes
[R,C] = size(Vold);
Vnew = zeros(R,C);
for r = 2:R-1
    for c = 2:C-1
        Vnew(r,c) = 0.25*(Vold(r-1,c)+Vold(r+1,c)+Vold(r,c-1)+Vold(r,c+1));
    end
end
end