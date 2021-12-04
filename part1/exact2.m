function [UEXACT] = exact2(t, x, y)
global k1 d1 
    UEXACT = exp(-k1^2 * d1 *pi^2*t) * (sin(k1 * pi * x) *ones(1, length(y)));
end