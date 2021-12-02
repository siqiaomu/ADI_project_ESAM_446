clear all
clc
close all

Ttot = 10; %total time
dt = .02;
N = Ttot/dt; %N = time steps
t = 0:dt:Ttot;

% y0 =1;
yf = ones(1,N);
yb = ones(1,N);
yadi = ones(1,N);
yexact = ones(1,N);

for j = 2:N
yf(j) = yf(j-1)*(1-dt);
yb(j) = yb(j-1)*(1/(1+dt));
yadi(j) = yadi(j-1)*((1-dt/2)/(1+dt/2));
yexact(j) = yexact(j-1)*(exp(-dt));
end

figure(1)
hold on
plot(1:N,yf,'ro') % plot of forward Euler
plot(1:N,yb,'bo') % plot of backward Euler
plot(1:N,yadi,'g','Linewidth',1.5) % plot of ODEADI
plot(1:N,yexact,'k','Linewidth',1.5) %plot of exact solution
xlabel('time t (s)')
ylabel('y(t)')
title('Exact Solution Compared with ODEADI, Forward Euler, and Backward Euler')
legend('Forward Euler','Backward Euler','ODEADI','Exact Solution')
hold off