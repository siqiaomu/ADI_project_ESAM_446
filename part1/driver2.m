function [x, y, dtplot_output] = driver2(setupfilename, outputfilename, outputfilenameexact)

global NX NY XL XR YBOT YTOP k1 k2 d1 d2 DT TFIN NSTEPS DTPLOT

[NX, NY, XL, XR, YBOT, YTOP, k1, k2, d1, d2, DT, TFIN, NSTEPS, DTPLOT] = setup(setupfilename);
hx = 1/(NX - 1);
hy = 1/(NY - 1);
betax = DT/(2 * hx^2) *d1;
betay = DT/(2 * hy^2) * d2;
x = (XL:hx:XR)';
y = YBOT:hy:YTOP;
U = init2(x, y);
UNEW = zeros(NX, NY);

UOUT = zeros(NX, NY);

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
        RHSY = (1 - 2 * betax) * UHALF(j, :) + betax * UHALF(j - 1, :) + betax * UHALF(j + 1, :);
        RHSY(1) = 0;
        RHSY(NY) = 0;
        [AY, BY, CY, M] = mat(betay, NY);
        SOLY = tri(NY, AY, BY, CY, RHSY);
        UNEW(j, :) = SOLY;
    end
    U = UNEW;
    if itime == round(DTPLOT/DT)
        UOUT = U;
    end
end

writematrix(UOUT, outputfilename);

UEXACT = exact2(DTPLOT, x, y);

writematrix(UEXACT, outputfilenameexact);

dtplot_output = DTPLOT;

end