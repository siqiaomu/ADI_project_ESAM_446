%part 0 - ADI project 

%the correct code:
%solving y' = -y  
%y(0)=1
%y=exp(-t)


clear all
clc
close all

Ttot = 16; %total time
dt = 4;
N = Ttot/dt; %N = time steps
Ttot = N*dt;
t = 0:dt:Ttot;
%plot against t = N*dt = Ttot

% since y(0) = 1:
yf = ones(1,N);
yb = ones(1,N);
yadi = ones(1,N);
yexact = ones(1,N);

for j = 2:length(t)
yf(j) = yf(j-1)*(1-dt);
yb(j) = yb(j-1)*(1/(1+dt));
yadi(j) = yadi(j-1)*((1-dt/2)/(1+dt/2));
yexact(j) = yexact(j-1)*(exp(-dt));
end

figure(1)
hold on
% plot(t,yf,'ro','Linewidth',1.7) % plot of forward Euler
plot(t,yb,'b','Linewidth',1.7) % plot of backward Euler
plot(t,yadi,'g','Linewidth',1.7) % plot of ODEADI
plot(t,yexact,'k','Linewidth',1.5) %plot of exact solution
xlabel('time t (s)')
ylabel('y(t)')
xlim([0 12.5])
title('Exact Solution Compared with ODEADI and Backward Euler')
legend('Backward Euler','ODEADI','Exact Solution')
hold off