clear;
global NX NY XL XR YBOT YTOP k1 k2 d1 d2 DT TFIN NSTEPS DTPLOT

[NX, NY, XL, XR, YBOT, YTOP, k1, k2, d1, d2, DT, TFIN, NSTEPS, DTPLOT] = setup('adiset.csv');

hx = 1/(NX - 1);
hy = 1/(NY - 1);
betax = DT/(2 * hx^2);
betay = DT/(2 * hy^2);
x = XL:hx:XR;
y = (YBOT:hy:YTOP)';
U = init(x, y);
UNEW = zeros(NX, NY);

UOUT = zeros(NX, NY);

for itime = 1:NSTEPS
    UHALF = zeros(NX, NY);
    for k = 2:(NY - 1)
        RHSX = (1 - 2 * betax) * U(:, k) + betax * U(:, k - 1) + betax * U(:, k + 1);
        RHSX(1) = 0;
        RHSX(NX) = 0;
        [AX, BX, CX, M] = mat(betax, NX);
        SOLX = tri(NX, AX, BX, CX, RHSX);
        UHALF(:, k) = SOLX';
    end
    for j = 2:(NX - 1)
        RHSY = (1 - 2 * betay) * UHALF(j, :) + betay * UHALF(j - 1, :) + betay * UHALF(j + 1, :);
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

UEXACT = exact(DTPLOT);

hold on
plot(UOUT(15, :), 'LineWidth', 5)
hold on
plot(UEXACT(15, :), 'LineWidth', 2)
hold off