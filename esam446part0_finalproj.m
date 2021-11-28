%esam 446 final project
%part 0 

clear all
clc
close all

%solving using i) scheme ODEADI (one half step of backward euler, then one
%half step of forward euler), ii) backward euler, iii) forward euler

%solving y' = -y  (where y' = dYdt)
%y(0)=1
%exact solution: y = exp(-t)

t0 = 0; %initial time
tf = 10; %final time
dt = 0.02; %step size
t = t0:dt:tf; %time as the independent variable

y(1)=1; %initial condition for forward euler
ybackward(1)=y(1); %initial condition for backward euler
yadi(1)=y(1); %initial condition for ODEADI 
yexact(1)=y(1); %exact y value at t=0

for i=1:length(t)-1
    dYdt(i)=(-1)*y(i);
    y(i+1)=y(i)+dt*dYdt(i); %forward euler equation

    dYdt(i+1)=(-1)*y(i+1);
    ybackward(i+1)=y(i)+dt*dYdt(i+1); %backward euler equation

    yadi(i+1)=y(i)+(dYdt(i)+dYdt(i+1))*0.5*dt; %ODEADI

    yexact(i+1)=exp((-1)*t(i+1)); %exact y(t) equation
end

figure(1)
hold on
plot(t,y,'ro')                      %plot of forward euler
plot(t,ybackward,'bo')              %plot of backward Euler
plot(t,yadi,'g','Linewidth',1.5)    %plot of ODEADI
plot(t,yexact,'k','Linewidth',1.5)  %plot of exact solution
xlabel('time t (s)')
ylabel('y(t)')
title('Exact Solution Compared with ODEADI, Forward Euler, and Backward Euler')
legend('Forward Euler','Backward Euler','ODEADI','Exact Solution')
hold off

