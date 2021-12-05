function [A, B, C] = mat(beta, N) %does not require global variables
    A = [-beta*ones(1, N-2) 0];
    B = [1 (1+2*beta)*ones(1, N-2) 1];
    C = [0 -beta*ones(1, N-2)];
end