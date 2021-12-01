NX = 51;
NY = 51;
XL = 0;
XR = 1;
YBOT = 0;
YTOP = 1;
k1 = 1;
k2 = 1;
d1 = 1;
d2 = 1;
DT = 0.01;
TFIN = 0.1;
NSTEPS = 100; %?????
DTPLOT = [0.05, 0.1];


U = driver(NSTEPS, NX, NY, k1, k2, DT, TFIN)

UEXACT = exact(NSTEPS * DT, NX, NY, d1, d2, k1, k2);

hold on
plot(U(:, 25))
hold on
plot(UEXACT(:, 25))
hold off

function [u0] = init(x, y, k1, k2)
    u0 = sin(k2 * pi * y) * sin(k1 * pi * x);
end

function [X] = tri(N, A, B, C, D)
    X = zeros(1, N);
    AP = A;
    BP = B;
    CP = C;
    DP = D;
    for i = 2:N
        W = AP(i - 1)/BP(i - 1);
        BP(i) = BP(i) - W * CP(i - 1);
        DP(i) = DP(i) - W * DP(i - 1);
    end
    X(N) = DP(N)/BP(N);
    for j = N-1:-1:1
        X(j) = (DP(j) - CP(j) * X(j + 1))/BP(j);
    end 
end

function [A, B, C] = mat(beta, dx, h, N)
    A = [-beta*ones(1, N-1)];
    B = [(1+2*beta)*ones(1, N)];
    C = [-beta*ones(1, N-1)];
end

function [UEXACT] = exact(t, NX, NY, d1, d2, k1, k2)
    x = 0:(1/(NX - 1)):1;
    y = (0:(1/(NY - 1)):1)';
    UEXACT = exp(-(k1^2 * d1 + k2^2 * d2)*t) * sin(k2 * pi * y)  * sin(k1 * pi * x);
end


function [U] = driver(NSTEPS, NX, NY, k1, k2, DT, TFIN)
    hx = 1/(NX - 1);
    hy = 1/(NY - 1);
    betax = DT/(2 * hx^2);
    betay = DT/(2 * hy^2);
    x = 0:hx:1;
    y = (0:hy:1)';
    U = init(x, y, k1, k2);
    UNEW = 0 * U;
    for itime = 1:NSTEPS
        UHALF = 0 * U;
        for k = 2:(NY - 1)
            RHSX = 0 * (1:NX);
            for j = 2:(NX - 1)
                RHSX(j) = (1 - 2 * betax) * U(j, k) + betax * U(j, k - 1) + betax * U(j, k + 1);
            end
            RHSX(1) = 0;
            RHSX(NX) = 0;
            [AX, BX, CX] = mat(betax, hx, DT, NX);
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
            [AY, BY, CY] = mat(betay, hy, DT, NY);
            SOLY = tri(NY, AY, BY, CY, RHSY);
            for k = 1:NY
                UNEW(j, k) = SOLY(k);
            end
        end
        U = UNEW;
        

    end

end

