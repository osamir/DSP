close all; clear;clc;
% y[n] = x[n]- x[n-1] -y[n-1]
b = [1 -1]; % coefficient of x
a = [1 1]; % coefficient of y
%% plot impulse response
impz(b,a,20),grid;

%% plot frequency response
w=(-1:0.001:1)*pi;
H_w = freqz(b,a,w);
figure
subplot(2,1,1)
hndl(1)=plot(w/pi,abs(H_w)); grid
ylim([0 min(10,max(abs(H_w)))])
xlabel('Normalized Frequency (\times\pi rad/sample)') 
ylabel('|H|')
title('Magnitude Response')

subplot(2,1,2)
hndl(2)=plot(w/pi,angle(H_w)/pi); grid
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('\angleH (\times\pi rad/sample)')
title('Phase Response')
%% get response to x[n] = cos[pi*n/3]
% by filter function
n= -4:20;
x_n = cos(pi*n/3);
figure
subplot(2,1,1)
hndl(3)=stem(n,x_n);grid
title('x[n]=cos[pi*n/3]'),xlabel('n')

y_n = filter(b,a,x_n);
subplot(2,1,2)
hndl(4)=stem(n,y_n);grid
title('output signal y[n]'),xlabel('n')
set(hndl,'LineWidth',2)

%% get response to x[n] = (-1)^n *(u[n]-u[n-5])
% by filter function
n1= -2:10;
x_n1 = (-1).^n1 .*((n1>=0)-((n1-5)>=0));
figure
subplot(2,1,1)
hndl(3)=stem(n1,x_n1);grid
title('x[n]=(-1)^n *(u[n]-u[n-5])'),xlabel('n')

y_n1 = filter(b,a,x_n1);
subplot(2,1,2)
hndl(4)=stem(n1,y_n1);grid
title('output signal y[n]'),xlabel('n')
set(hndl,'LineWidth',2)