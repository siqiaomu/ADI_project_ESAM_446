function [X] = tri(N, A, B, C, D, X)
    AP = A;
    BP = B;
    CP = C;
    DP = D;
    for i = 2:N
        W = AP(i)/BP(i - 1);
        BP(i) = BP(i) - W * CP(i - 1);
        DP(i) = DP(i) - W * DP(i - 1);
    end
    X(N) = DP(N)/BP(N);
    for j = N-1:-1:1
        X(i) = (DP(i) - CP(i) * X(i + 1))/BP(i);
    end 
end