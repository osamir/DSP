close all; clear;clc;
n=-2:8;
x(1,:) = 3*(n-2==0);        % unit impulse 
x(2,:) = 2*((n-3)>=0);      % unit step
x(3,:) = exp(-n);           % exponential 
x(4,:) = sin((2*pi/4)*n);   % sinusoidal
x(5,:) = rand(size(n));     % uniformly distributed random signal [0:1]
x(6,:) = randn(size(n));    % gaussian distributed random signal

t={'3\delta[n-2]','2u[n-3]','e^{-n}','sin[2\pin/4]',...
    'uniformly distributed random','gaussian distributed random'};
for i=1:length(t)
    subplot(3,2,i)
    stem(n,x(i,:),'LineWidth',2),grid
    axis([n(1) n(end) max(min([x(i,:),0]),-10) min(max([x(i,:),0]),10)])
    xlabel('n'),ylabel('x[n]')
    title(t{i})
end