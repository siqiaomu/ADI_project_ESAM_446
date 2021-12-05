function [x, y, dt_output, dtplot_output] = driver(setupfilename, outputfilename)

global NX NY XL XR YBOT YTOP sigma xc yc d1 d2 DT TFIN NSTEPS DTPLOT

[NX, NY, XL, XR, YBOT, YTOP, sigma, xc, yc, d1, d2, DT, TFIN, NSTEPS, DTPLOT] = setup(setupfilename);
hx = 1/(NX - 1);
hy = 1/(NY - 1);


for dt = DT'
    dt
    betax = dt/(2 * hx^2) *d1;
    betay = dt/(2 * hy^2) * d2;
    x = (XL:hx:XR)';
    y = YBOT:hy:YTOP;
    U = init(x, y);
    NSTEPS = round(TFIN/dt);
    UNEW = zeros(NX, NY);
for itime = 1:NSTEPS
    UHALF = zeros(NX, NY);
    for k = 2:(NY - 1)
        RHSX = (1 - 2 * betay) * U(:, k) + betay * U(:, k - 1) + betay * U(:, k + 1);
        RHSX(1) = 0;
        RHSX(NX) = 0;
        [AX, BX, CX, M] = mat(betax, NX);
        SOLX = tri(NX, AX, BX, CX, RHSX);
        UHALF(:, k) = SOLX';
    end
    for j = 2:(NX - 1)
        UHALFt = UHALF'
        RHSY = (1 - 2 * betax) * UHALFt(:, j) + betax * UHALFt(:, j - 1) + betax * UHALFt(:, j + 1);
        RHSY(1) = 0;
        RHSY(NY) = 0;
        [AY, BY, CY, M] = mat(betay, NY);
        SOLY = tri(NY, AY, BY, CY, RHSY);
        UNEW(j, :) = SOLY;
    end
    U = UNEW;
    for dtplot = DTPLOT'
        if itime == round(dtplot/dt) 
            dtplot
            writematrix(U, strcat(outputfilename, 'DT' + string(dt) + 'DTPLOT' + string(dtplot) + '.csv'));
        end
    end
end

end

dt_output = DT;
dtplot_output = DTPLOT;

end