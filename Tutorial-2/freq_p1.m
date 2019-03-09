close all; clear;clc;
% y[n] = x[n]+ x[n-3] -y[n-4]
b = [1 0 0 1]; % coefficient of x
a = [1 0 0 0 1]; % coefficient of y

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
%% get response to x[n] = sin[pi*n/4]
% by filter function
n= 0:40;
x_n = sin(pi*n/4);
figure
subplot(2,1,1)
hndl(3)=stem(n,x_n);grid
title('input signal x[n]'),xlabel('n')

y_n = filter(b,a,x_n);
subplot(2,1,2)
hndl(4)=stem(n,y_n);grid
title('output signal y[n]'),xlabel('n')
set(hndl,'LineWidth',2)