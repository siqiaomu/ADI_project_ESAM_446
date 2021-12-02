function [UEXACT] = exact(t)
global NX NY XL XR YBOT YTOP k1 k2 d1 d2 
    x = XL:(1/(NX - 1)):XR;
    y = (YBOT:(1/(NY - 1)):YTOP)';
    UEXACT = exp(-(k1^2 * d1 + k2^2 * d2)*pi^2*t) * sin(k2 * pi * y)  * sin(k1 * pi * x);
end