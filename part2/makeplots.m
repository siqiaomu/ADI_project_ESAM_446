%q1 plots
clear;

setupfilename = 'adiset_q3.csv';
outputfilename = 'q3/adidat';
%[x, y, dt_output, dtplot_output] = driver(setupfilename, outputfilename);

%%
ymid = 0.5 * 2000 + 1;
xmid = 0.5 * 2000 + 1;

for dtplot = [1:10]/(1000)
    figure;
    for dt = [0.001 0.0005 0.0001 0.00005]
        UOUT = csvread(strcat(outputfilename, 'DT' + string(dt) + 'DTPLOT' + string(dtplot) + '.csv'));
        plot(x, UOUT(:, ymid), 'LineWidth',3)
        hold on
    end
hold off
xlabel('x')
ylabel('u(x, 0.5, ' + string(dtplot) + ')')
legend('0.001', '0.0005', '0.0001', '0.00005')
title('u(x, y, t) vs. u_{exact}(x, y, t) for y = 0.5, t = ' + string(dtplot))
%saveas(fig1, 'q3/plot1.png')
end

%%
uinit = init(x, y);
figure;
plot(x, uinit(:, ymid), 'LineWidth',3)