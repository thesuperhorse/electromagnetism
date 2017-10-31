function pointplot(gridpointsx,gridpointsy,innerx,innery,outerx,outery,contx,conty)
figure(4)
plot(gridpointsx,gridpointsy,'b*');
hold on;
o_x = max(size(outerx));
o_y = max(size(outery));
if (o_x < o_y)
    temp_outerx = outerx(1:o_x);
    temp_outery = outery(1:o_x);
    plot(temp_outerx,temp_outery,'kd');
elseif (o_y < o_x)
    temp_outerx = outerx(1:o_y);
    temp_outery = outery(1:o_y);
    plot(temp_outerx,temp_outery,'kd');
else
    plot(outerx,outery,'kd');
end
plot(innerx,innery,'ro');
plot(contx,conty, 'go');
title('Voltage node points with contour line');
xlabel('x(m)');
ylabel('y(m)');
hold off;
end