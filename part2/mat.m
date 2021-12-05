function [A, B, C, M] = mat(beta, N) %does not require global variables
    A = [-beta*ones(1, N-2) 0];
    B = [1 (1+2*beta)*ones(1, N-2) 1];
    C = [0 -beta*ones(1, N-2)];
    M = diag(B, 0) + diag(A, -1) + diag(C, 1);
end