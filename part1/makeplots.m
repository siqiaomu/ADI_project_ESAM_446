%q1 plots
clear;

setupfilename = 'q1/adiset_01.csv';
outputfilename = 'q1/adidat_01.csv';
outputfilenameexact = 'q1/adidatexact_01.csv';

[x, y, dtplot] = driver(setupfilename, outputfilename, outputfilenameexact);

UOUT = csvread(outputfilename);
UEXACT = csvread(outputfilenameexact);

ymid = 26;
xmid = 26;
fig1 = figure;
plot(x, UOUT(:, ymid), 'LineWidth',3)
hold on
plot(x, UEXACT(:, ymid), 'LineWidth',2)
hold off
xlabel('x')
ylabel('u(x, 0.5, ' + string(dtplot) + ')')
legend('ADI solution', 'exact solution')
title('u(x, y, t) vs. u_{exact}(x, y, t) for y = 0.5, t = ' + string(dtplot))
saveas(fig1, 'q1/plot1.png')

fig2 = figure;
plot(y, UOUT(xmid, :), 'LineWidth',3)
hold on
plot(x, UEXACT(xmid, :), 'LineWidth',2)
hold off
xlabel('y')
ylabel('u(0.5, y, ' + string(dtplot) + ')')
legend('ADI solution', 'exact solution')
title('u(x, y, t) vs. u_{exact}(x, y, t) for x = 0.5, t = ' + string(dtplot))
saveas(fig2, 'q1/plot2.png')

clear;

setupfilename = 'q1/adiset_005.csv';
outputfilename = 'q1/adidat_005.csv';
outputfilenameexact = 'q1/adidatexact_005.csv';

[x, y, dtplot] = driver(setupfilename, outputfilename, outputfilenameexact);

UOUT = csvread(outputfilename);
UEXACT = csvread(outputfilenameexact);

ymid = 26;
xmid = 26;
fig3 = figure;
plot(x, UOUT(:, ymid), 'LineWidth',3)
hold on
plot(x, UEXACT(:, ymid), 'LineWidth',2)
hold off
xlabel('x')
ylabel('u(x, 0.5, ' + string(dtplot) + ')')
legend('ADI solution', 'exact solution')
title('u(x, y, t) vs. u_{exact}(x, y, t) for y = 0.5, t = ' + string(dtplot))
saveas(fig3, 'q1/plot3.png')


fig4 = figure;
plot(y, UOUT(xmid, :), 'LineWidth',3)
hold on
plot(x, UEXACT(xmid, :), 'LineWidth',2)
hold off
xlabel('y')
ylabel('u(0.5, y, ' + string(dtplot) + ')')
legend('ADI solution', 'exact solution')
title('u(x, y, t) vs. u_{exact}(x, y, t) for x = 0.5, t = ' + string(dtplot))
saveas(fig4, 'q1/plot4.png')

clear;

