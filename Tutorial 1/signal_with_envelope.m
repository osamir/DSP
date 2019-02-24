x =@(n) sin((2*pi/sqrt(5))*n).*(n>=1);

n = -2:10;
t = n(1):.01:n(end);

stem(n,x(n),'LineWidth',2),hold on
plot(t,x(t),':','LineWidth',2),grid
xlabel('n'),ylabel('x[n]')
title('signal with envelope')