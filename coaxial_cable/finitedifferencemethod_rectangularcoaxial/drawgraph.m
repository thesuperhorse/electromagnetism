function drawgraph(gridpointsx,gridpointsy,V,Ex,Ey,a,b,Vo)
figure(1)
contourf(gridpointsx,gridpointsy,V');
title('Contour Voltage Distribution');
xlabel('x(m)');
ylabel('y(m)');
axis([0 a 0 b])
figure(2)
quiver(gridpointsx,gridpointsy,Ex',Ey');
title('Electric Field Distribution');
xlabel('x(m)');
ylabel('y(m)');
figure(3)
meshc(gridpointsx,gridpointsy,V');
title('Voltage Distribution');
xlabel('x(m)');
ylabel('y(m)');
zlabel('V(Volts)');
axis([0 a 0 b 0 Vo])
end