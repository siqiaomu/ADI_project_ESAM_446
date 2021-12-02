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
        RHSX = 0 * (1:NX);
        for j = 2:(NX - 1)
            RHSX(j) = (1 - 2 * betax) * U(j, k) + betax * U(j, k - 1) + betax * U(j, k + 1);
        end
        RHSX(1) = 0;
        RHSX(NX) = 0;
        [AX, BX, CX, M] = mat(betax, NX);
        SOLX = tri(NX, AX, BX, CX, RHSX);
        for j = 1:NX
            UHALF(j, k) = SOLX(j);
        end
    end
    for j = 2:(NX - 1)
        RHSY = 0 * (1:NY);
        for k = 2:(NY - 1)
            RHSY(k) = (1 - 2 * betay) * UHALF(j, k) + betay * UHALF(j - 1, k) + betay * UHALF(j + 1, k);
        end
        RHSY(1) = 0;
        RHSY(NY) = 0;
        [AY, BY, CY, M] = mat(betay, NY);
        SOLY = tri(NY, AY, BY, CY, RHSY);
        for k = 1:NY
            UNEW(j, k) = SOLY(k);
        end
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