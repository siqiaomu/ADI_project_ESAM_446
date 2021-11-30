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