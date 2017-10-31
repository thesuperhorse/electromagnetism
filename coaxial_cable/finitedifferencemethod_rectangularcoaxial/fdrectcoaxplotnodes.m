function [gridpointsx,gridpointsy,innerx,innery,outerx,outery,contx,conty] = fdrectcoaxplotnodes(a,b,c,d,xo,yo,Nx,Ny,contour)
%Initial constants
hx=a/(Nx-1);
hy=hx;
%inside box
innerstartx = round(xo/hx+1);
innerendx = round(innerstartx+c/hx);
innerstarty = round(yo/hy+1);
innerendy = round(innerstarty+d/hy);
%%
%***************PLOTTING VALUES
[gridpointsx,gridpointsy]=meshgrid(0:hx:a,0:hy:b);
[innerx,innery]=meshgrid((innerstartx-1)*hx:hx:(innerendx-1)*hx,(innerstarty-1)*hy:hy:(innerendy-1)*hy);
outerx=[0:hx:a,a*ones(1,Ny-2),a:-hx:0,zeros(1,Ny-1)];
outery=[zeros(1,Nx),hy:hy:(b-hy),b*ones(1,Nx),(b-hy):-hy:0];
%%
%***************Contourplot
left = innerstartx-contour;
right = innerendx+contour;
num_y = innerendy-innerstarty+2*contour-2;
contx=[(left)*hx:hx:(right)*hx,(right)*hx*ones(1,num_y),(right)*hx:-hx:(left)*hx,(left)*hx*ones(1,num_y)];
top = innerstarty-contour;
bottom = innerendy+contour;
num_x = innerendx-innerstartx+2*contour;
conty=[(top)*hy*ones(1,num_x),(top+1)*hy:hy:(bottom-1)*hy,(bottom)*hy*ones(1,num_x),(bottom-1)*hy:-hy:(top+1)*hy];
end