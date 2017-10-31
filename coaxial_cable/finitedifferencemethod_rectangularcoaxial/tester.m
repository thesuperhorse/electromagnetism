% % %http://ieeexplore.ieee.org/xpl/abstractMetrics.jsp?tp=&arnumber=4380328&url=http%3A%2F%2Fieeexplore.ieee.org%2Fstamp%2Fstamp.jsp%3Ftp%3D%26arnumber%3D4380328
% % %In-Lab question 1
% % a = 1;
% % b = 1;
% % c = 0.5;
% % d = 0.5;
% % xo = 0;
% % yo = 0;
% % er = 1;
% % Vo = 5;
% % contour = 1;
% % 
% % [V,Ex,Ey,C,We,We2,gridpointsx,gridpointsy,innerx,innery,outerx,outery,contx,conty]= bvprectangularcoax(a,b,c,d,xo,yo,er,Vo,contour);
% % pointplot(gridpointsx,gridpointsy,innerx,innery,outerx,outery,contx,conty);
% % drawgraph(gridpointsx,gridpointsy,V,Ex,Ey,a,b,Vo);
% % keyboard
% 
% %In-Lab question 2 a)
% a = 0.0022;
% b = 0.002;
% c = 0.001;
% d = 0.0008;
% xo = 0.0006;
% yo = 0.0006;
% er = 1;
% Vo = 1;
% contour = 1;
% 
% [V,Ex,Ey,C,We,We2,gridpointsx,gridpointsy,innerx,innery,outerx,outery,contx,conty]= bvprectangularcoax(a,b,c,d,xo,yo,er,Vo,contour);
% pointplot(gridpointsx,gridpointsy,innerx,innery,outerx,outery,contx,conty);
% drawgraph(gridpointsx,gridpointsy,V,Ex,Ey,a,b,Vo);
% keyboard
% 
% a = 4e-3;
% b = 4e-3;
% c = 2e-3;
% d = 2e-3;
% xo = 1e-3;
% yo = 1e-3;
% er = 1;
% Vo = 1;
% contour = 1;
% 
% [V,Ex,Ey,C,We,We2,gridpointsx,gridpointsy,innerx,innery,outerx,outery,contx,conty]= bvprectangularcoax(a,b,c,d,xo,yo,er,Vo,contour);
% pointplot(gridpointsx,gridpointsy,innerx,innery,outerx,outery,contx,conty);
% drawgraph(gridpointsx,gridpointsy,V,Ex,Ey,a,b,Vo);
% keyboard

a = 1e-3;
b = 0.5e-3;
c = 0.2e-3;
d = 0.1e-3;
xo = 0.2e-3;
yo = 0.2e-3;
er = 2;
Vo = 1;
contour = 15;

[V,Ex,Ey,C,We,We2,gridpointsx,gridpointsy,innerx,innery,outerx,outery,contx,conty]= bvprectangularcoax(a,b,c,d,xo,yo,er,Vo,contour);
pointplot(gridpointsx,gridpointsy,innerx,innery,outerx,outery,contx,conty);
drawgraph(gridpointsx,gridpointsy,V,Ex,Ey,a,b,Vo);