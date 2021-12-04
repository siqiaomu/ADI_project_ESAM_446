function [UEXACT] = exact(t, x, y)
global k1 k2 d1 d2 
    UEXACT = exp(-(k1^2 * d1 + k2^2 * d2)*pi^2*t) *sin(k1 * pi * x) *  sin(k2 * pi * y);
end