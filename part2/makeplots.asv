%q1 plots
clear;

setupfilename = 'adiset_q3.csv';
outputfilename = 'q3/adidat';
%[x, y, dt_output, dtplot_output] = driver(setupfilename, outputfilename);

%%
ymid = 0.5 * 2000 + 1;
xmid = 0.5 * 2000 + 1;
x = 0:(1/2000):1;
y = 0:(1/2000):1;

dtplotlist = [1:10]/(1000);

for j = 1:10
    dtplot = dtplotlist(j);
    fig1 = figure;
    dtlist = [0.001 0.0005 0.0001 0.00005];
    colorlist = {"red", "black", "green", "blue"};  % "green" #77AC30
    linelist = [4.5 3.5 2.5 1.5];
    for i = 1:4 
        dt = dtlist(i);
        color = colorlist{i};
        line = linelist(i);

        UOUT = csvread(strcat(outputfilename, 'DT' + string(dt) + 'DTPLOT' + string(dtplot) + '.csv'));
        plot(x,UOUT(xmid,:),color,'LineWidth',line)
        hold on
    end
hold off
xlabel('x')
ylabel('u(0.5, y, ' + string(dtplot) + ')')
legend('0.001', '0.0005', '0.0001', '0.00005')
title('u(x, y, t) for x = 0.5, t = ' + string(dtplot))
saveas(fig1, 'q3/plotx' + string(j) + '.png')
%subplots
end

%%
% uinit = init(x, y);
% figure;
% plot(x, uinit(:, ymid), 'LineWidth',3)