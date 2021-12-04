function [x, y, dtplot_output] = driver3(setupfilename, outputfilename, outputfilenameexact) %backward euler

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
    UNEW = zeros(NX, NY);
    for k = 2:(NY - 1)
        RHSX = U(:, k);
        RHSX(1) = 0;
        RHSX(NX) = 0;
        [AX, BX, CX, M] = mat(betax, NX);
        SOLX = tri(NX, AX, BX, CX, RHSX);
        UNEW(:, k) = SOLX';
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