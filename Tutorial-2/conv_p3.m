n1=-3:8;
% z[n]=u[n+1]-u[n-7]
z=((n1+1)>=0)-((n1-7)>=0);
subplot(3,1,1)
hndl(1)=stem(n1,z);grid
title('x[n]')

n2=5:15;
% w[n]=alpha^(n).(u[n]-u[n-11])
w=2.^-(n2-7).*((n2-7)>=0);
subplot(3,1,2)
hndl(2)=stem(n2,w);grid
title('h[n]')

n=n1(1)+n2(1):n1(end)+n2(end);

y=conv(z,w);
subplot(3,1,3)
hndl(3)=stem(n,y);grid
xlim([n(1) n(end)])
title('h[n]*x[n]')
set(hndl,'LineWidth',2)