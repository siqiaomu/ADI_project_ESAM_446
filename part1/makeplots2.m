%q2 plots 
setupfilename = 'q2/adiset_01.csv';
outputfilename = 'q2/adidat_01.csv';
outputfilenameexact = 'q2/adidatexact_01.csv';

[x, y, dtplot] = driver2(setupfilename, outputfilename, outputfilenameexact);

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
saveas(fig1, 'q2/plot1.png')

clear;

setupfilename = 'q2/adiset_005.csv';
outputfilename = 'q2/adidat_005.csv';
outputfilenameexact = 'q2/adidatexact_005.csv';

[x, y, dtplot] = driver2(setupfilename, outputfilename, outputfilenameexact);

UOUT = csvread(outputfilename);
UEXACT = csvread(outputfilenameexact);

ymid = 26;
fig2 = figure;
plot(x, UOUT(:, ymid), 'LineWidth',3)
hold on
plot(x, UEXACT(:, ymid), 'LineWidth',2)
hold off
xlabel('x')
ylabel('u(x, 0.5, ' + string(dtplot) + ')')
legend('ADI solution', 'exact solution')
title('u(x, y, t) vs. u_{exact}(x, y, t) for y = 0.5, t = ' + string(dtplot))
saveas(fig2, 'q2/plot2.png')

clear;

setupfilename = 'q2/adiset_005.csv';
outputfilename = 'q2/adidat_005.csv';
outputfilenameexact = 'q2/adidatexact_005.csv';

[x, y, dtplot] = driver3(setupfilename, outputfilename, outputfilenameexact);

UOUT = csvread(outputfilename);
UEXACT = csvread(outputfilenameexact);

ymid = 26;
fig2 = figure;
plot(x, UOUT(:, ymid), 'LineWidth',3)
hold on
plot(x, UEXACT(:, ymid), 'LineWidth',2)
hold off
xlabel('x')
ylabel('u(x, 0.5, ' + string(dtplot) + ')')
legend('Backward Euler solution', 'exact solution')
title('u(x, y, t) vs. u_{exact}(x, y, t) for y = 0.5, t = ' + string(dtplot))
saveas(fig2, 'q3/plot1.png')
